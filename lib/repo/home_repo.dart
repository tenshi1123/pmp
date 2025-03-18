import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pmp_english/student_models/diem_danh_model.dart';
import 'package:pmp_english/student_models/home_model.dart';
import 'package:pmp_english/utils/constants/api_path.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeRepo {
  Dio dio = Dio();
  //Lấy danh sách bài tập
  Future<ListExcerciseModel> getListBaiTap() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    dio.options.headers['Authorization'] = 'Bearer $token';
    Response response;
    response = await dio.post(
      ApiPath.baiTap,
    );
    //return DiemDanhModel.fromJson(response.data['data']);
    return ListExcerciseModel.fromJson((response.data)['data']);
  }

  //Lấy chi tiết bài tập
  Future<DetailExcerciseModel> getDetailExsercise(
      {required String id, required String customerCourseScheduleId}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    dio.options.headers['Authorization'] = 'Bearer $token';
    Response response;
    response = await dio.post(ApiPath.detailBaiTap,
        data: jsonEncode({
          'id': int.tryParse(id),
          'customer_course_schedule_id': int.tryParse(
            customerCourseScheduleId,
          ),
        }));
    //return DiemDanhModel.fromJson(response.data['data']);
    return DetailExcerciseModel.fromJson((response.data)['data']);
  }

  //Báo cáo điểm
  Future<BaoCaoHocTapModel> getBaoCaoDiem() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    dio.options.headers['Authorization'] = 'Bearer $token';
    Response response;
    response = await dio.post(
      ApiPath.reportExercise,
    );
    //return DiemDanhModel.fromJson(response.data['data']);
    return BaoCaoHocTapModel.fromJson((response.data)['data']);
  }

  Future<InfoDiemDanh> getDetailDiemDanh(String id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    dio.options.headers['Authorization'] = 'Bearer $token';
    Response response;
    response =
        await dio.post(ApiPath.detailDiemdanh, data: jsonEncode({"id": id}));
    return InfoDiemDanh.fromJson((response.data)['data']);
  }
}
