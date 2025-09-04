import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pmp_english/student_models/diem_danh_model.dart';
import 'package:pmp_english/student_models/excercise_model.dart';
import 'package:pmp_english/student_models/gift_models.dart';
import 'package:pmp_english/student_models/home_model.dart';
import 'package:pmp_english/student_models/profile_model.dart';
import 'package:pmp_english/utils/DioClient.dart';
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

  //Lấy chi tiết bài tập chi tiet bai tap
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

  //load bài tập trắc nghiệm
  Future<List<QuestionGroupModel>> viewTracNghiem({
    required String id,
    required String customerCourseScheduleId,
    required String examDetailId,
  }) async {
    final dio = await DioClient.getInstance();
    Response response;
    response = await dio.post(
      ApiPath.viewTracNghiem,
      data: jsonEncode(
        {
          'id': int.tryParse(id),
          'customer_course_schedule_id': int.tryParse(
            customerCourseScheduleId,
          ),
          'exam_detail_id': int.tryParse(examDetailId),
        },
      ),
    );
    return ((response.data['data']['question'] as List)
        .map((e) => QuestionGroupModel.fromJson(e))
        .toList());
  }

  //load bài tập trắc nghiệm đã làm
  Future<List<QuestionGroupModel>> viewTestDone({
    required String id,
  }) async {
    final dio = await DioClient.getInstance();
    Response response;
    response = await dio.post(
      ApiPath.viewTestDone,
      data: jsonEncode(
        {
          'ccsee_id': int.tryParse(id),
        },
      ),
    );
    //return DiemDanhModel.fromJson(response.data['data']);
    return ((response.data['data']['question'] as List)
        .map((e) => QuestionGroupModel.fromJson(e))
        .toList());
  }

  Future uploadExcercise(
      {required String id,
      required String courseScheduleId,
      required String note,
      File? photo}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    dio.options.headers['Authorization'] = 'Bearer $token';
    FormData formData;
    if (photo == null) {
      formData = FormData.fromMap({
        'id': id,
        'customer_course_schedule_id': courseScheduleId,
        'note': note,
      });
    } else {
      formData = FormData.fromMap({
        'id': id,
        'customer_course_schedule_id': courseScheduleId,
        'note': note,
        'file': [
          await MultipartFile.fromFile(photo.path,
              filename: photo.path.split('/').last),
        ]
      });
    }
    await dio.post(ApiPath.submitExeTL, data: formData);
  }

  Future<String> submitTracNghiem({
    required String id,
    required String examDetailId,
    required String customerCourseScheduleId,
    required String startTime,
    required List<Map<String, String>> data,
  }) async {
    final dio = await DioClient.getInstance();
    final body = {
      "id": int.parse(id),
      "exam_detail_id": int.parse(examDetailId),
      "customer_course_schedule_id": int.parse(customerCourseScheduleId),
      "start_time": startTime,
      "data": data,
    };

    Response response;
    dio.interceptors.add(LogInterceptor(
      responseBody: true,
      requestBody: true,
      logPrint: (obj) => debugPrint('📦 $obj'),
    ));
    response = await dio.post(ApiPath.submitTracNghiem, data: body);
    // in ra log lỗi

    return response.data;
    //return '';
  }

  //Báo cáo điểm
  Future<BaoCaoHocTapModel> getBaoCaoDiem() async {
    final dio = await DioClient.getInstance();
    Response response;
    response = await dio.post(
      ApiPath.reportExercise,
    );
    //return DiemDanhModel.fromJson(response.data['data']);
    return BaoCaoHocTapModel.fromJson((response.data)['data']);
  }

  Future<InfoDiemDanh> getDetailDiemDanh(String id) async {
    final dio = await DioClient.getInstance();
    Response response;
    response =
        await dio.post(ApiPath.detailDiemdanh, data: jsonEncode({"id": id}));
    return InfoDiemDanh.fromJson((response.data)['data']);
  }

  Future<List<PostModel>> getlistPost(int page) async {
    final dio = await DioClient.getInstance();
    Response response;
    response = await dio.post(ApiPath.post,
        data: jsonEncode({
          'page': page,
          'limit': 10,
        }));
    List<PostModel> list = [];
    for (var item in response.data['data']['value']) {
      list.add(PostModel.fromJson(item));
    }
    return list;
  }

  Future<DetailPostModel> getDetailPost({required String id}) async {
    final dio = await DioClient.getInstance();
    Response response;
    response = await dio.post(ApiPath.postDetail, data: jsonEncode({"id": id}));
    return DetailPostModel.fromJson((response.data)['data']);
  }

  Future<GiftModel> getListGift() async {
    final dio = await DioClient.getInstance();
    Response response;
    response = await dio.post(ApiPath.gift,
        data: jsonEncode({
          'page': 1,
          'limit': 10,
        }));
    return GiftModel.fromJson((response.data)['data']);
  }

  Future<String> changeGift({
    required Set<String> id,
  }) async {
    final dio = await DioClient.getInstance();
    Response response;
    dio.interceptors.add(LogInterceptor(
      responseBody: true,
      requestBody: true,
      logPrint: (obj) => debugPrint('📦 $obj'),
    ));
    try {
      response = await dio.post(ApiPath.giftChange,
          data: jsonEncode({
            'gift_id': id.join(','),
          }));

      if (response.data['type'] == 'error') {
        return "Error, Đổi quà thất bại";
      } else if (response.data['type'] == 'success') {
        return "Đổi quà thành công";
      } else if (response.data['type'] == 'warning') {
        return "Warning, Đổi quà thất bại";
      }
      return "Đổi quà thất bại";
    } catch (e) {
      return 'Đổi quà thất bại, vui lòng thử lại sau';
    }
  }
}
