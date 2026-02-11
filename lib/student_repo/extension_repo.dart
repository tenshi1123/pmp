import 'package:dio/dio.dart';
import 'package:pmp_english/student_models/review_models.dart';
import 'package:pmp_english/utils/constants/api_path.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:pmp_english/utils/DioClient.dart';

class ExtensionRepo {
  // Dio dio = Dio(); // Removed
  // Lấy danh sách đánh giá của học viên
  Future<List<ReviewModels>> getListReview() async {
    final dio = await DioClient.getInstance();
    // Interceptor handle Auth
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
    final dio = await DioClient.getInstance();
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
