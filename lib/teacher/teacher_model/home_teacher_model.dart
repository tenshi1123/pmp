class TeacherHomeModel {
  final List<LichHocModel> lichhoc;
  final List<LichHenModel> lichhen;
  TeacherHomeModel({
    required this.lichhoc,
    required this.lichhen,
  });
  factory TeacherHomeModel.fromJson(Map<String, dynamic> json) {
    return TeacherHomeModel(
      lichhoc: (json['lichhoc'] as List)
          .map((data) => LichHocModel.fromJson(data))
          .toList(),
      lichhen: (json['lichhen'] as List)
          .map((data) => LichHenModel.fromJson(data))
          .toList(),
    );
  }
}

class LichHocModel {
  final String id;
  final String name;
  final String courseScheduleName;
  final DateTime day;
  final String dayOfWeek;
  final String time;
  final String phongHoc;
  final String coSo;
  final String type;
  LichHocModel({
    required this.id,
    required this.name,
    required this.courseScheduleName,
    required this.day,
    required this.dayOfWeek,
    required this.time,
    required this.phongHoc,
    required this.coSo,
    required this.type,
  });
  factory LichHocModel.fromJson(Map<String, dynamic> json) {
    return LichHocModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      courseScheduleName: json['course_schedule_name'] ?? '',
      day: DateTime.parse(json['day'] ?? ''),
      dayOfWeek: json['day_of_week'] ?? '',
      time: json['time'] ?? '',
      phongHoc: json['phong_hoc'] ?? '',
      coSo: json['coso'] ?? '',
      type: json['type'] ?? '',
    );
  }
}

class LichHenModel {
  final String cosoName;
  final String address;
  final String fullName;
  final String phone;
  final String email;
  final String userName;
  final String teacherName;
  final String id;
  final DateTime appointmentDate;
  LichHenModel({
    required this.cosoName,
    required this.address,
    required this.fullName,
    required this.phone,
    required this.email,
    required this.userName,
    required this.teacherName,
    required this.id,
    required this.appointmentDate,
  });
  factory LichHenModel.fromJson(Map<String, dynamic> json) {
    return LichHenModel(
      cosoName: json['coso_name'] ?? '',
      address: json['address'] ?? '',
      fullName: json['full_name'] ?? '',
      phone: json['phone'] ?? '',
      email: json['email'] ?? '',
      userName: json['user_name'] ?? '',
      teacherName: json['teachers_full_name'] ?? '',
      id: json['id'] ?? '',
      appointmentDate: DateTime.parse(json['appointment_date'] ?? ''),
    );
  }
}
