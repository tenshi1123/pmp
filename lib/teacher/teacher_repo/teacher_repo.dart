import 'package:dio/dio.dart';
import 'package:pmp_english/student_models/profile_model.dart';
import 'package:pmp_english/teacher/teacher_model/home_teacher_model.dart';
import 'package:pmp_english/utils/constants/api_path_teacher.dart';
import 'package:pmp_english/utils/constants/const_string.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:pmp_english/utils/DioClient.dart';

class TeacherRepo {
  // Dio dio = Dio(); // Removed
  Future<TeacherHomeModel?> getHomeInfo() async {
    final dio = await DioClient.getInstance();
    // Interceptor handles Auth
    Response response;
    try {
      response = await dio.post(
        ApiPathTeacher.teachersUrl,
      );
      return TeacherHomeModel.fromJson(response.data['data']);
    } on DioException {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove(ConstString.type);
      await prefs.remove('token');
    } catch (e) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove('token');
      await prefs.remove(ConstString.type);
    }
    return null;
  }

  Future<List<LichHocModel>> getLichDay(
      {required String day1, required String day2}) async {
    final dio = await DioClient.getInstance();
    Response response;
    response = await dio.post(
      ApiPathTeacher.lichDay,
      data: {
        'start_day': day1,
        'end_day': day2,
      },
    );
    List<LichHocModel> reults = [];
    for (var item in response.data['data']['value']) {
      reults.add(LichHocModel.fromJson(item));
    }
    return reults;
  }

  Future<TeacherProfileModel> getCustomerProfile() async {
    final dio = await DioClient.getInstance();
    Response response;
    response = await dio.post(
      ApiPathTeacher.profile,
    );
    return TeacherProfileModel.fromJson(response.data['data']['value']);
  }

  Future<List<NotiModel>> getListNoti() async {
    final dio = await DioClient.getInstance();
    Response response;
    response = await dio.post(
      ApiPathTeacher.notification,
      data: {
        'page': 1,
      },
    );
    List<NotiModel> reults = [];
    for (var item in response.data['data']['value']) {
      reults.add(NotiModel.fromJson(item));
    }
    return reults;
  }
}
