import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pmp_english/student_models/lichthi_models.dart';
import 'package:pmp_english/utils/constants/api_path.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:pmp_english/utils/DioClient.dart';

class ExamScheduleRepo {
  // Dio dio = Dio(); // Removed
  Future<LichthiModel> getLichThi() async {
    final dio = await DioClient.getInstance();
    Response response;
    response = await dio.post(
      ApiPath.offlineExamSchedule,
    );
    return LichthiModel.fromJson(response.data['data']);
  }

  Future<List<String>> changeCoso(
      {required String cosoId, required int type}) async {
    final dio = await DioClient.getInstance();
    Response response;
    response = await dio.post(ApiPath.changeCoso,
        data: jsonEncode({
          'coso_id': int.parse(cosoId),
          'type': type,
        }));
    List<String> list = [];
    for (var item in response.data['data']['value']) {
      list.add(item['day']);
    }
    return list;
  }

  Future<List<ValueModel>> changeDay(
      {required String cosoId, required int type, required String day}) async {
    final dio = await DioClient.getInstance();
    Response response;
    response = await dio.post(ApiPath.changeDay,
        data: jsonEncode({
          'coso_id': int.parse(cosoId),
          'type': type,
          'day': day,
        }));
    List<ValueModel> list = [];
    for (var item in response.data['data']['value']) {
      list.add(ValueModel.fromJson(item));
    }
    return list;
  }

  Future dkiThi({required String id}) async {
    final dio = await DioClient.getInstance();
    Response response;
    response = await dio.post(ApiPath.dangKyThi,
        data: jsonEncode({
          'ca_thi_id': id,
        }));
    return response.data['data'];
  }
}
