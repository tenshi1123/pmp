import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pmp_english/student_models/customer_models.dart';
import 'package:pmp_english/student_models/profile_model.dart';
import 'package:pmp_english/utils/DioClient.dart';
import 'package:pmp_english/utils/constants/api_path.dart';
import 'package:pmp_english/utils/constants/const_string.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomerRepo {
  // Dio dio = Dio(); // Removed
  Future<StudentHomeModel?> getHomeInfo() async {
    final dio = await DioClient.getInstance();
    Response response;
    try {
      response = await dio.post(
        ApiPath.hocvienUrl,
      );
      return StudentHomeModel.fromJson(response.data['data']);
    } on DioException {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove('token');
      await prefs.remove(ConstString.type);
    } catch (e) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove('token');
      await prefs.remove(ConstString.type);
      print(e);
    }
    return null;
  }

  Future<DetailRcmCourse> getDetailRecomentCourse({required String id}) async {
    final dio = await DioClient.getInstance();
    Response response;
    response = await dio.post(ApiPath.coureDetail,
        data: jsonEncode({
          'id': int.tryParse(id),
        }));
    return DetailRcmCourse.fromJson(response.data['data']);
  }

  Future<List<CalendarModel>> getListTkb(
      {required String day1, required String day2}) async {
    final dio = await DioClient.getInstance();
    Response response;
    response = await dio.post(ApiPath.calendar,
        data: jsonEncode({
          'start_day': day1,
          'end_day': day2,
        }));
    List<CalendarModel> list = [];
    for (var item in response.data['data']['value']) {
      list.add(CalendarModel.fromJson(item));
    }
    return list;
  }

  Future<ProfileModel> getCustomerProfile() async {
    final dio = await DioClient.getInstance();
    // dio.interceptors.add(LogInterceptor... ); // Keep logging if needed, but safer to rely on base client or add selectively. Assuming remove manual header logic is primary goal.
    // Re-adding log usage locally if strictly needed or just clean up.
    // The previous code added a LogInterceptor every time this method was called, which is BAD (multiple interceptors piling up).
    // I will remove the local interceptor addition to fix that bug too.
    Response response;
    response = await dio.post(
      ApiPath.profile,
    );
    return ProfileModel.fromJson(response.data['data']['value']);
  }

  Future<String> changePassword(
      String oldPass, String password, String newPass) async {
    final dio = await DioClient.getInstance();
    Response response;
    response = await dio.post(ApiPath.changePassword, data: {
      'password_old': oldPass,
      'pass_new': password,
      're_pass_new': newPass,
    });
    return response.data['message'];
  }

  Future<String> changeInfo(
      {required String name,
      required String phone,
      required String email,
      required String dob,
      required String address}) async {
    try {
      final dio = await DioClient.getInstance();
      final response = await dio.post(
        ApiPath.changeInfo,
        data: {
          'full_name': name,
          'phone': phone,
          'email': email,
          'dob': dob,
          'address': address,
          // 'target_ielts': '0' // Bỏ nếu không cần
        },
      );
      final data = response.data;
      if (data['type'] == 'success') {
        return 'Cập nhật thông tin thành công';
      } else if (data['type'] == 'error') {
        final message = data['message'];
        if (message is Map) {
          return message.entries.map((e) => e.value.toString()).join(', ');
        }
        return message.toString();
      } else {
        return 'Có lỗi không xác định xảy ra.';
      }
    } catch (e) {
      if (e is DioException) {
        return 'Lỗi mạng hoặc server: ${e.message}';
      }
      return 'Đã xảy ra lỗi: ${e.toString()}';
    }
  }

  Future<List<PaymentModel>> getPayment() async {
    final dio = await DioClient.getInstance();
    Response response;
    response = await dio.post(
      ApiPath.payment,
    );
    List<PaymentModel> list = [];
    for (var item in response.data['data']['value']) {
      list.add(PaymentModel.fromJson(item));
    }
    return list;
  }

  Future<List<NotiModel>> getListNoti() async {
    final dio = await DioClient.getInstance();
    Response response;
    response = await dio.post(
      ApiPath.notification,
    );
    List<NotiModel> reults = [];
    for (var item in response.data['data']['value']) {
      reults.add(NotiModel.fromJson(item));
    }
    return reults;
  }
}
