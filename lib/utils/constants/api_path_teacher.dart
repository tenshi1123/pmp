class ApiPathTeacher {
  //baseurl
  static const String baseUrl = 'https://lms.pmpenglish.edu.vn/';
  static const String teachersUrl = '${baseUrl}api/teachers';
  //api về đăng nhập, các thông tin của học sinh
  static const String refreshToken = '$teachersUrl/refresh_token/';
  static const String login = '$teachersUrl/login';
  static const String getClass = '$teachersUrl/lop-hoc';
  static const String detailsClass = '$teachersUrl/lop-hoc/detail';
  static const String detailBuoihoc = '$teachersUrl/lop-hoc/detail/buoi_hoc';
  //Thông tin và đổi thông tin học viên
  static const String profile = '$teachersUrl/profile';
  //Diem danh
  static const String notification = '$teachersUrl/notification';
  //lich-day
  static const String lichDay = '$teachersUrl/lich-day';
}
