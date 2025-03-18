import 'package:dio/dio.dart';
import 'package:pmp_english/student_models/customer_models.dart';
import 'package:pmp_english/utils/constants/api_path.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomerRepo {
  Dio dio = Dio();
  Future<StudentHomeModel> getHomeInfo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    dio.options.headers['Authorization'] = 'Bearer $token';
    Response response;
    response = await dio.post(
      ApiPath.hocvienUrl,
    );
    return StudentHomeModel.fromJson(response.data['data']);
  }
}
