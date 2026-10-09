import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioClient {
  static Dio? _dio;
  static final DioClient _instance = DioClient._internal();

  factory DioClient() {
    return _instance;
  }

  DioClient._internal();

  Future<Dio> get dio async {
    if (_dio != null) return _dio!;
    _dio = await _initDio();
    return _dio!;
  }

  static Future<Dio> getInstance() async {
    if (_dio != null) return _dio!;
    _dio = await _instance._initDio();
    return _dio!;
  }

  Future<Dio> _initDio() async {
    final dio = Dio();
    
    // Set default configs
    dio.options.connectTimeout = const Duration(seconds: 30);
    dio.options.receiveTimeout = const Duration(seconds: 30);
    dio.options.sendTimeout = const Duration(seconds: 30);

    dio.interceptors.add(
      QueuedInterceptorsWrapper(
        onRequest: (options, handler) async {
          final prefs = await SharedPreferences.getInstance();
          final token = prefs.getString('token');

          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          // Preserve existing headers if any (e.g. 'Token' header used in some repos)
          return handler.next(options); 
        },
        onError: (DioException error, handler) async {
          if (error.response?.statusCode == 401) {
            final prefs = await SharedPreferences.getInstance();
            final oldToken = prefs.getString('token');

            if (oldToken != null && oldToken.isNotEmpty) {
              try {
                // Tạo một instance Dio mới để gọi refresh token, tránh bị loop interceptor
                final refreshDio = Dio();
                
                // Gọi API refresh token
                final response = await refreshDio.post(
                  'https://lms.pmpenglish.edu.vn/api/customer/refresh_token/',
                  data: {
                    'token': oldToken,
                  },
                  options: Options(
                    headers: {
                      'Authorization': 'Bearer $oldToken',
                    }
                  )
                );

                if (response.statusCode == 200) {
                  // Lấy token mới từ response (cấu trúc tùy thuộc backend, giả định là 'token' hoặc 'refresh_token')
                  final newToken = response.data['refresh_token'] ?? response.data['token'];
                  
                  if (newToken != null && newToken.isNotEmpty) {
                    // Lưu đè token mới
                    await prefs.setString('token', newToken);

                    // Cập nhật lại header của request bị lỗi
                    final options = error.requestOptions;
                    options.headers['Authorization'] = 'Bearer $newToken';

                    // Retry lại request bị lỗi bằng một Dio instance khác hoặc cấu hình cơ bản
                    final retryDio = Dio();
                    retryDio.options.baseUrl = dio.options.baseUrl;
                    final retryResponse = await retryDio.fetch(options);
                    
                    return handler.resolve(retryResponse);
                  }
                }
              } catch (e) {
                // Nếu refresh thất bại, trả về lỗi 401 ban đầu để xử lý logout
                return handler.next(error);
              }
            }
          }
          return handler.next(error);
        },
      ),
    );

    return dio;
  }
}
