import 'package:dio/dio.dart';
import 'package:pmp_english/student_models/review_models.dart';
import 'package:pmp_english/utils/constants/api_path.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExtensionRepo {
  Dio dio = Dio();
  // Lấy danh sách đánh giá của học viên
  Future<List<ReviewModels>> getListReview() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    dio.options.headers['Authorization'] = 'Bearer $token';
    Response response;
    response = await dio.post(
      ApiPath.listFeedback,
    );
    List<ReviewModels> list = [];
    for (var item in response.data['data']['value']) {
      list.add(ReviewModels.fromJson(item));
    }
    return list;
  }

  // Lấy chi tiết đánh giá của học viên
  Future<ReviewDetailModels> getDetailReview(String id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    dio.options.headers['Authorization'] = 'Bearer $token';
    Response response;
    response = await dio.post(
      ApiPath.detailsFeedback,
      data: {
        'id': id,
      },
    );
    return ReviewDetailModels.fromJson(response.data['data']['value']);
  }
}
