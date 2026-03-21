class ApiPathTeacher {
  //baseurl
  static String baseUrl = 'https://lms.pmpenglish.edu.vn/';
  static String teachersUrl = '${baseUrl}api/teachers';
  static String pushTeacherOnesignal = '${baseUrl}api/teachers/onesignal';
  //api về đăng nhập, các thông tin của học sinh
  static String refreshToken = '$teachersUrl/refresh_token/';
  static String login = '${baseUrl}api/teachers/login';
  static String getClass = '$teachersUrl/lop-hoc';
  static String detailsClass = '$teachersUrl/lop-hoc/detail';
  static String detailBuoihoc = '$teachersUrl/lop-hoc/detail/buoi_hoc';
  //api chi tiet bai tap, de thi
  static String detailsExam =
      '$teachersUrl/lop-hoc/detail/buoi_hoc/detail_bai_tap_de_thi';
  //chi tiet bai tap tu luan hoc vien lam
  static String examStudent =
      '$teachersUrl/lop-hoc/detail/buoi_hoc/view_bai_hoc_vien_lam';
  //cham bai
  static String chamBai =
      '$teachersUrl/lop-hoc/detail/buoi_hoc/cham_bai_hoc_vien_lam';
  //Thông tin và đổi thông tin học viên
  static String profile = '$teachersUrl/profile';
  //api thông báo
  static String notification = '$teachersUrl/notification';
  //lich-day
  static String lichDay = '$teachersUrl/lich-day';
  //chat
  static String chat = '$teachersUrl/chat';
  static String chatMessages = '$teachersUrl/chat_messages';
  static String listCustomers = '$teachersUrl/chat/list_customer';
  static String createConversation = '$teachersUrl/chat/chat_teachers_customer';
}
