class StudentHomeModel {
  final CustomerInfoModel customerInfoModel;
  final String totalCourse;
  final String chuyenCan;
  StudentHomeModel({
    required this.customerInfoModel,
    required this.totalCourse,
    required this.chuyenCan,
  });
  factory StudentHomeModel.fromJson(Map<String, dynamic> json) {
    return StudentHomeModel(
      customerInfoModel: CustomerInfoModel.fromJson(json['customer']),
      totalCourse: json['total_course'],
      chuyenCan: json['chuyen_can'],
    );
  }
}

class CustomerInfoModel {
  final String id;
  final String code;
  final String fullName;
  final String phone;
  final String email;
  final String gender;
  final String dob;
  final String img;
  final String schoolName;
  final String address;
  final String targetIelts;

  CustomerInfoModel({
    required this.id,
    required this.code,
    required this.fullName,
    required this.phone,
    required this.email,
    required this.gender,
    required this.dob,
    required this.img,
    required this.schoolName,
    required this.address,
    required this.targetIelts,
  });
  factory CustomerInfoModel.fromJson(Map<String, dynamic> json) {
    return CustomerInfoModel(
      id: json['id'] ?? '',
      code: json['code'],
      fullName: json['full_name'] ?? '',
      phone: json['phone'] ?? '',
      email: json['email'],
      gender: json['gender'],
      dob: json['dob'],
      img: json['img'],
      schoolName: json['school_name'],
      address: json['address'],
      targetIelts: json['target_ielts'],
    );
  }
}

class CalendarModel {
  final String id;
  final String courseScheduleAlias;
  final String day;
  final String name;
  final String timeStart;
  final String timeEnd;
  final String cosoAddress;
  final String phongHocName;
  final String teacherName;
  final String teacherAvatar;
  final String type;

  CalendarModel({
    required this.id,
    required this.courseScheduleAlias,
    required this.day,
    required this.name,
    required this.timeStart,
    required this.timeEnd,
    required this.cosoAddress,
    required this.phongHocName,
    required this.teacherName,
    required this.teacherAvatar,
    required this.type,
  });
  factory CalendarModel.fromJson(Map<String, dynamic> json) {
    return CalendarModel(
      id: json["id"] ?? '',
      courseScheduleAlias: json["course_schedule_alias"] ?? '',
      day: json["day"] ?? '',
      name: json["name"] ?? '',
      timeStart: json["time_start"] ?? '',
      timeEnd: json["time_end"] ?? '',
      cosoAddress: json["coso_address"] ?? '',
      phongHocName: json['phonghoc_name'] ?? '',
      teacherName: json['teachers_full_name'] ?? '',
      teacherAvatar: json['teachers_avatar'] ?? '',
      type: json['type'] ?? '',
    );
  }
}
