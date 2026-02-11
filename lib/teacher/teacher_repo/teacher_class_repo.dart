import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pmp_english/teacher/teacher_model/teacher_class_model.dart';
import 'package:pmp_english/utils/constants/api_path_teacher.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:pmp_english/utils/DioClient.dart';

class TeacherClassRepo {
  // Dio dio = Dio(); // Removed
  Future<TeacherClassModel> getTeacherClass() async {
    final dio = await DioClient.getInstance();
    // Interceptor handle Auth
    Response response;
    response = await dio.post(
      ApiPathTeacher.getClass,
    );
    return TeacherClassModel.fromJson(response.data['data']);
  }

  Future<DetailClass> getDetailLopHoc(String id) async {
    final dio = await DioClient.getInstance();
    Response response;
    response = await dio.post(ApiPathTeacher.detailsClass,
        data: jsonEncode({'id': id}));
    return DetailClass.fromJson(response.data['data']);
  }

  Future<List<DiemDanhHSModel>> getListDiemDanh(
      {required String courseScheduleId, required String id}) async {
    final dio = await DioClient.getInstance();
    Response response;
    response = await dio.post(
      ApiPathTeacher.detailBuoihoc,
      data: {
        'course_schedule_id': courseScheduleId,
        'id': id,
        'type': 'diem_danh',
      },
    );
    List<DiemDanhHSModel> result = [];
    result = (response.data['data']['value'] as List)
        .map((data) => DiemDanhHSModel.fromJson(data))
        .toList();
    return result;
  }

  Future<List<ExamModel>> getlistExam({
    required String courseScheduleId,
    required String id,
    required int type,
  }) async {
    final dio = await DioClient.getInstance();
    Response response;
    response = await dio.post(
      ApiPathTeacher.detailBuoihoc,
      data: {
        'course_schedule_id': courseScheduleId,
        'id': id,
        'type': type == 1 ? 'bai_tap' : 'de_thi',
      },
    );
    List<ExamModel> result = [];
    result = (response.data['data']['value'] as List)
        .map((data) => ExamModel.fromJson(data))
        .toList();
    return result;
  }

  Future<DetailedExamModel> getDetailedExam({
    required String id,
  }) async {
    final dio = await DioClient.getInstance();
    Response response;
    response = await dio.post(
      ApiPathTeacher.detailsExam,
      data: {
        'id': id,
      },
    );
    return DetailedExamModel.fromJson(response.data['data']);
  }

  Future<DetailedExamModel> getStudentHomework({
    required String id,
  }) async {
    final dio = await DioClient.getInstance();
    Response response;
    response = await dio.post(
      ApiPathTeacher.examStudent,
      data: {
        'id': id,
      },
    );
    return DetailedExamModel.fromJson(response.data['data']);
  }

  Future uploadExcercise(
      {required String id,
      required String finalMark,
      required String note,
      File? photo}) async {
    final dio = await DioClient.getInstance();
    FormData formData;
    if (photo == null) {
      formData = FormData.fromMap({
        'id': id,
        'final_mark': finalMark,
        'note_teachers': note,
        'file': null,
      });
    } else {
      formData = FormData.fromMap({
        'id': id,
        'final_mark': finalMark,
        'note_teachers': note,
        'file': [
          await MultipartFile.fromFile(photo.path,
              filename: photo.path.split('/').last),
        ]
      });
    }
    // for (var file in photo) {
    //   formData.files.addAll([
    //     MapEntry(
    //         "file[]",
    //         await MultipartFile.fromFile(file.path,
    //             filename: file.path.split('/').last)),
    //   ]);
    // }
    await dio.post(ApiPathTeacher.chamBai, data: formData);
  }
}
