class ApiPath {
  //baseurl
  static const String baseUrl = 'https://lequydon.hvg.edu.vn/api';
  //api về đăng nhập, các thông tin của học sinh
  static const String refreshToken = '$baseUrl/refresh_token/';
  static const String login = '$baseUrl/login';
  static const String home = '$baseUrl/home';
  static const String changePass = '$baseUrl/change_password';
  static const String subject = '$baseUrl/subject';
  static const String detailSubject = '$baseUrl/detail_subject';
  static const String lesson = '$baseUrl/chi_tiet_buoi_hoc';
  static const String thacMac = '$baseUrl/thac_mac';
  static const String listQuestion = '$baseUrl/chi-tiet-thac_mac';
  //api về phần chat
  static const String chat = '$baseUrl/chat';
  static const String chatMessage = '$baseUrl/chat_messages';
  static const String loadMessage = '$baseUrl/load_content_chat_messages';
  static const String sendMessage = '$baseUrl/send_chat_messages';
  static const String sendImg = '$baseUrl/send_chat_messages_img';
  static const String listTeachers = '$baseUrl/danh_sach_giao_vien';
  static const String chatTeacher = '$baseUrl/chat_teachers_students';
  // api doc tai lieu
  static const String viewVideo = '$baseUrl/view_video';
  static const String viewDocument = '$baseUrl/view_document';
  //api danh sach bai tap
  static const String listExcercise = '$baseUrl/danh_sach_bai_tap';
  static const String listQuiz = '$baseUrl/quiz';
  static const String submitTest = '$baseUrl/nop_bai_trac_nghiem';
  static const String submitEssay = '$baseUrl/nop_bai_tu_luan';
  // api danh sach thong bao
  static const String listNotification = '$baseUrl/danh_sach_thong_bao';
  //api về thời khóa biểu
  static const String calender = '$baseUrl/lich_hoc';
  //api do oneSignal cung cấp
  static const String oneSignal =
      'https://api.onesignal.com/notifications?app_id=1f643336-9d73-4c65-ac00-38d499b8c462';
}
