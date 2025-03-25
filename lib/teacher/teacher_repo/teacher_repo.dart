import 'package:dio/dio.dart';
import 'package:pmp_english/student_models/profile_model.dart';
import 'package:pmp_english/teacher/teacher_model/home_teacher_model.dart';
import 'package:pmp_english/utils/constants/api_path_teacher.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TeacherRepo {
  Dio dio = Dio();
  Future<TeacherHomeModel> getHomeInfo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    dio.options.headers['Authorization'] = 'Bearer $token';
    Response response;
    response = await dio.post(
      ApiPathTeacher.teachersUrl,
    );
    return TeacherHomeModel.fromJson(response.data['data']);
  }

  Future<List<NotiModel>> getListNoti() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    dio.options.headers['Authorization'] = 'Bearer $token';
    Response response;
    response = await dio.post(
      ApiPathTeacher.notification,
    );
    List<NotiModel> reults = [];
    for (var item in response.data['data']['value']) {
      reults.add(NotiModel.fromJson(item));
    }
    return reults;
  }
}
