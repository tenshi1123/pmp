import 'package:dio/dio.dart';
import 'package:pmp_english/student_models/home_model.dart';
import 'package:pmp_english/student_models/my_course_model.dart';
import 'package:pmp_english/utils/DioClient.dart';
import 'package:pmp_english/utils/constants/api_path.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MycourseRepo {
  Dio dio = Dio();

  Future<List<MyCourseModel>> getListMyCourse() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    dio.options.headers['Authorization'] = 'Bearer $token';
    Response response;
    response = await dio.post(
      ApiPath.myCourse,
    );
    List<MyCourseModel> list = [];
    for (var item in response.data['data']['value']) {
      list.add(MyCourseModel.fromJson(item));
    }
    return list;
  }

  Future<DetailMyCourse> getDetailMyCourse({required String id}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    dio.options.headers['Authorization'] = 'Bearer $token';
    Response response;
    response = await dio.post(
      ApiPath.detailMyCourse,
      data: {
        'id': id,
      },
    );
    return DetailMyCourse.fromJson(response.data['data']);
  }

  Future<DetailBaoCaoModel> getMycourseBaocao({required String id}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    dio.options.headers['Authorization'] = 'Bearer $token';
    Response response;
    response = await dio.post(
      ApiPath.detailBaoCao,
      data: {
        'id': id,
      },
    );
    return DetailBaoCaoModel.fromJson(response.data['data']);
  }

  Future<MycourseBaiTapModel> getMycourseBaitap({required String id}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    dio.options.headers['Authorization'] = 'Bearer $token';
    Response response;
    response = await dio.post(
      ApiPath.myCoursedetailBaiTap,
      data: {
        'id': id,
      },
    );
    return MycourseBaiTapModel.fromJson(response.data);
  }

  Future<VideoLessonModel> getVideoLesson({
    required String id,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    dio.options.headers['Authorization'] = 'Bearer $token';
    Response response;
    response = await dio.post(
      ApiPath.detailBuoihoc,
      data: {'id': id, 'type': "video"},
    );
    return VideoLessonModel.fromJson(response.data['data']['value']);
  }

  Future<List<BaiTapValueModel>> getExerciseLesson({
    required String id,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    dio.options.headers['Authorization'] = 'Bearer $token';
    Response response;
    response = await dio.post(
      ApiPath.detailBuoihoc,
      data: {'id': id, 'type': "exercise"},
    );
    List<BaiTapValueModel> list = [];
    for (var item in response.data['data']['exercise']) {
      list.add(BaiTapValueModel.fromJson(item));
    }
    return list;
  }

  Future<List<DeValueModel>> getDocument({
    required String id,
  }) async {
    final dio = await DioClient.getInstance();
    Response response;
    response = await dio.post(
      ApiPath.detailBuoihoc,
      data: {'id': id, 'type': "document"},
    );
    List<DeValueModel> list = [];
    for (var item in response.data['data']['document']) {
      list.add(DeValueModel.fromJson(item));
    }
    return list;
  }

  Future<EvaluationModel> getEvaluation({
    required String id,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    dio.options.headers['Authorization'] = 'Bearer $token';
    Response response;
    response = await dio.post(
      ApiPath.detailBuoihoc,
      data: {'id': id, 'type': "evaluation"},
    );
    return EvaluationModel.fromJson(response.data['data']['evaluation']);
  }

  Future<String> takeADayOff(
    String id,
    String reason,
  ) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      Response response;
      response = await dio.post(ApiPath.xinNghi, data: {
        'id': id,
        'reason': reason,
      });
      if (response.data['type'] == 'error') {
        return "Xin nghỉ thất bại - error";
      } else if (response.data['type'] == 'success') {
        return "Xin nghỉ thành công";
      } else if (response.data['type'] == 'warning') {
        return "Xin nghỉ thất bại - warning";
      }
      return "Đã có lỗi xảy ra, vui lòng thử lại sau";
    } catch (e) {
      return "Xin nghỉ thất bại";
    }
  }
}
