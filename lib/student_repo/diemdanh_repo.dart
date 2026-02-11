import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pmp_english/student_models/diem_danh_model.dart';
import 'package:pmp_english/utils/constants/api_path.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:pmp_english/utils/DioClient.dart';

class DiemdanhRepo {
  // Dio dio = Dio(); // Removed
  Future<List<DiemDanhModel>> getListDiemDanh() async {
    final dio = await DioClient.getInstance();
    Response response;
    response = await dio.post(
      ApiPath.diemDanh,
    );
    //return DiemDanhModel.fromJson(response.data['data']);
    List<DiemDanhModel> result = ((response.data)['data']['value'] as List)
        .map((e) => DiemDanhModel.fromJson(e))
        .toList();
    return result;
  }

  Future<InfoDiemDanh> getDetailDiemDanh(String id) async {
    final dio = await DioClient.getInstance();
    Response response;
    response =
        await dio.post(ApiPath.detailDiemdanh, data: jsonEncode({"id": id}));
    return InfoDiemDanh.fromJson((response.data)['data']);
  }
}
