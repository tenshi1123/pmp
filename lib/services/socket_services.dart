import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;

class SocketService {
  WebSocketChannel? _channel;
  Function(Map<String, dynamic>)? onMessage;
  bool isConnected = false;

  static const String _baseUrl = 'https://lms.pmpenglish.edu.vn';
  static const String _wsUrl = 'wss://ws.hvgcloud.net';

  /// 🔹 Lấy token từ API CI4
  static Future<String?> fetchToken({
    required String site,
    required String role,
    required String userId,
  }) async {
    try {
      final uri = Uri.parse(
          '$_baseUrl/auth/token?site=$site&role=$role&userId=$userId');
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['token'];
      }
    } catch (e) {
      print('⚠️ Lỗi khi lấy token: $e');
    }
    return null;
  }

  /// 🔹 Gọi API get_info_socket

  /// 🔹 Kết nối và register socket
  Future<void> connect({
    required String site,
    required String role,
    required String userId,
  }) async {
    final token = await fetchToken(site: site, role: role, userId: userId);
    if (token == null) {
      print('❌ Không thể lấy token');
      return;
    }

    try {
      _channel = WebSocketChannel.connect(Uri.parse(_wsUrl));
      isConnected = true;

      print("✅ WS connected");

      // Gửi lệnh register giống web
      final registerData = {
        "event": "register",
        "site": site,
        "type": role,
        "id": userId,
        "token": token,
      };

      _channel!.sink.add(jsonEncode(registerData));

      _channel!.stream.listen((message) {
        final data = jsonDecode(message);
        onMessage?.call(data);
      }, onDone: () {
        print("❌ WS disconnected");
        isConnected = false;
        _reconnect(site, role, userId);
      }, onError: (error) {
        print("⚠️ WS error: $error");
        isConnected = false;
        _reconnect(site, role, userId);
      });
    } catch (e) {
      print("⚠️ Lỗi kết nối WS: $e");
      _reconnect(site, role, userId);
    }
  }

  /// 🔁 Tự động reconnect
  void _reconnect(String site, String role, String userId) async {
    await Future.delayed(const Duration(seconds: 2));
    await connect(site: site, role: role, userId: userId);
  }

  /// 🔹 Gửi dữ liệu qua WS
  void send(Map<String, dynamic> data) {
    if (isConnected && _channel != null) {
      _channel!.sink.add(jsonEncode(data));
    }
  }

  /// 🔹 Đóng kết nối
  void disconnect() {
    _channel?.sink.close(status.goingAway);
    isConnected = false;
  }
}
