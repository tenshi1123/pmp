class ApiPath {
  //baseurl
  static String baseUrl = 'https://lms.pmpenglish.edu.vn/';

  static String hocvienUrl = '${baseUrl}api/customer';

  //api về đăng nhập, các thông tin của học sinh
  static String refreshToken = '$hocvienUrl/refresh_token/';
  static String login = '$hocvienUrl/login';

  //Thông tin và đổi thông tin học viên
  static String profile = '$hocvienUrl/profile';
  static String changePassword = '$hocvienUrl/profile/change_password';
  static String changeAvatar = '$hocvienUrl/change_avatar';
  static String changeInfo = '$hocvienUrl/profile/edit';

  //Danh sách tin tức
  static String post = '$hocvienUrl/post';
  static String postDetail = '$hocvienUrl/post/detail';

  //Diem danh
  static String diemDanh = '$hocvienUrl/diem_danh';
  static String detailDiemdanh = '$hocvienUrl/detail_diem_danh';
  static String notification = '$hocvienUrl/notification';
  static String chat = '$hocvienUrl/chat';
  static String teacherChat = '${baseUrl}api/teachers/chat';
  static String chatTeacherCustomer = '$hocvienUrl/chat_teachers_customer';
  static String chatTeacher = '$hocvienUrl/chat_messages';
  static String sendMessage = '$hocvienUrl/send_chat_messages';
  static String sendImageMessage = '$hocvienUrl/send_chat_img';
  static String listTeachers = '$hocvienUrl/list_teachers';
  //Lịch thi
  static String offlineExamSchedule = '$hocvienUrl/offline_exam_schedule';
  static String changeCoso = '$offlineExamSchedule/change_coso';
  static String changeDay = '$offlineExamSchedule/change_day';
  static String dangKyThi = '$offlineExamSchedule/dang_ky';

  //Bài tập + báo báo cáo học tập + feedback
  static String baiTap = '$hocvienUrl/bai_tap';
  static String detailBaiTap = '$hocvienUrl/mycourse/detail_exercise';
  static String reportExercise = '$hocvienUrl/bao_cao_hoc_tap';
  static String listFeedback = '$hocvienUrl/danh_gia';
  static String detailsFeedback = '$hocvienUrl/detail_danh_gia';
  //TKB
  static String calendar = '$hocvienUrl/calendar';

  //Khóa học của tôi khoa hoc
  static String myCourse = '$hocvienUrl/mycourse';
  static String detailMyCourse = '$myCourse/detail';
  static String detailBaoCao = '$myCourse/detail/bao_cao';
  static String myCoursedetailBaiTap = '$myCourse/detail/bai_tap';
  //Chi tiet khoa hoc
  static String coureDetail = '$hocvienUrl/course/detail';
  //Xin nghi
  static String xinNghi = '$myCourse/xin_nghi';
  //Buổi học
  static String detailBuoihoc = '$myCourse/detail/buoi_hoc';
  static String submitExeTL = '$myCourse/submit_exercise_tu_luan';
  static String submitTracNghiem = '$myCourse/nop_bai_trac_nghiem';
  static String submitSpeaking = '$myCourse/nop_bai_speaking';
  static String viewTracNghiem = '$myCourse/view_trac_nghiem';
  static String viewTestDone = '$myCourse/xem_lai_bai_trac_nghiem';
  //quà tặng
  static String gift = '$hocvienUrl/gift';
  static String giftChange = '$hocvienUrl/gift/change';
  //payment
  static String payment = '$hocvienUrl/payment';

  //push onesignal
  static String pushOnesignal = '$hocvienUrl/onesignal';

  // get token for socket
  static String getSocketToken = '${baseUrl}auth/token';
  static String getInfoSocket = '${baseUrl}auth/get_info_socket';
  //api do oneSignal cung cấp
  // static  String oneSignal =
  //     'https://api.onesignal.com/notifications?app_id=1f643336-9d73-4c65-ac00-38d499b8c462';
}
