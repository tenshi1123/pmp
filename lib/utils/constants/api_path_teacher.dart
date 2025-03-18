class ApiPathTeacher {
  //baseurl
  static const String baseUrl = 'https://lms.pmpenglish.edu.vn/';

  static const String teachersUrl = '${baseUrl}api/teachers';

  //api về đăng nhập, các thông tin của học sinh
  static const String refreshToken = '$teachersUrl/refresh_token/';
  static const String login = '$teachersUrl/login';

  //Thông tin và đổi thông tin học viênviên
  static const String profile = '$teachersUrl/profile';
  static const String changePassword = '$teachersUrl/change_password';
  static const String changeAvatar = '$teachersUrl/change_avatar';
  static const String changeInfo = '$teachersUrl/profile/edit';

  //Danh sách tin tức
  static const String post = '$teachersUrl/post';
  static const String postDetail = '$teachersUrl/post/detail';

  //Diem danh
  static const String diemDanh = '$teachersUrl/diem_danh';
  static const String detailDiemdanh = '$teachersUrl/detail_diem_danh';
  static const String notification = '$teachersUrl/notification';
  static const String chat = '$teachersUrl/chat';
  static const String chatTeacherCustomer =
      '$teachersUrl/chat_teacher_customer';
  static const String chatTeacher = '$teachersUrl/chat_messages';
  static const String sendMessage = '$teachersUrl/send_chat_messages';
  //Lịch thi
  static const String offlineExamSchedule =
      '$teachersUrl/offline_exam_schedule';
  static const String changeCoso = '$offlineExamSchedule/change_coso';
  static const String changeDay = '$offlineExamSchedule/change_day';
  static const String dangKyThi = '$offlineExamSchedule/dang_ky';

  static const String reportExercise = '$teachersUrl/bao_cao_hoc_tap';

  //TKB
  static const String calendar = '$teachersUrl/calendar';
  static const String listFeeback = '$teachersUrl/danh_gia';
  static const String detailsFeedback = '$teachersUrl/detail_danh_gia';
  //Khóa học của tôi
  static const String myCourse = '$teachersUrl/mycourse';
  static const String detailMyCourse = '$myCourse/detail';
  //Chi tiet khoa hoc
  static const String coureDetail = '$teachersUrl/course/detail';
  //Xin nghi
  static const String xinNghi = '$myCourse/xin_nghi';
  static const String detailBuoihoc = '$myCourse/detail/buoi_hoc';
  static const String baiTapKhoahoc = '$myCourse/detail/bai_tap';
  static const String detailBaitap = '$myCourse/detail_exercise';
  static const String submitExeTL = '$myCourse/submit_exercise_tu_luan';

  //api do oneSignal cung cấp
  // static const String oneSignal =
  //     'https://api.onesignal.com/notifications?app_id=1f643336-9d73-4c65-ac00-38d499b8c462';
}
