import 'package:intl/intl.dart';

class MyCourseModel {
  final String id;
  final String cosoName;
  final String teacherName;
  final String ccsStatus;
  final String name;
  final String img;
  final String alias;
  final String totalDathemvaoCuocHop;
  final String totalBuoiHoc;
  final String totalAttended;
  final String statusName;
  MyCourseModel({
    required this.id,
    required this.cosoName,
    required this.teacherName,
    required this.ccsStatus,
    required this.name,
    required this.img,
    required this.alias,
    required this.totalDathemvaoCuocHop,
    required this.totalBuoiHoc,
    required this.totalAttended,
    required this.statusName,
  });
  factory MyCourseModel.fromJson(Map<String, dynamic> json) {
    return MyCourseModel(
      id: json['id'],
      cosoName: json['coso_name'],
      teacherName: json['teachers_full_name'],
      ccsStatus: json['ccs_status'],
      name: json['name'],
      img: json['img'],
      alias: json['alias'],
      totalDathemvaoCuocHop: json['total_da_them_vao_cuoc_hop'],
      totalBuoiHoc: json['total_buoi_hoc'],
      totalAttended: json['total_attended'],
      statusName: json['status_name'],
    );
  }
}

class DetailMyCourse {
  final String id;
  final String alias;
  final String name;
  final String img;
  final String settingCourseTypeId;
  final String courseScheduleId;
  final List<DetailCourse> saptoi;
  final List<DetailCourse> daqua;
  DetailMyCourse({
    required this.id,
    required this.alias,
    required this.name,
    required this.img,
    required this.settingCourseTypeId,
    required this.courseScheduleId,
    required this.saptoi,
    required this.daqua,
  });
  factory DetailMyCourse.fromJson(Map<String, dynamic> json) {
    return DetailMyCourse(
      id: json["value"]["id"] ?? '',
      alias: json["value"]["alias"] ?? '',
      name: json["value"]["name"] ?? '',
      img: json["value"]["img"] ?? '',
      settingCourseTypeId: json["value"]["setting_course_type_id"] ?? '',
      courseScheduleId: json["value"]["course_schedule_id"] ?? '',
      saptoi: ((json['sap_toi'] as List)
          .map((e) => DetailCourse.fromJson(e))
          .toList()),
      daqua: ((json['da_qua'] as List)
          .map((e) => DetailCourse.fromJson(e))
          .toList()),
    );
  }
}

class DetailCourse {
  final String id;
  final String name;
  final String teachingContent;
  final DateTime day;
  final String time;
  final String teacherName;
  final String phongHoc;
  final String cosoName;
  final String cosoAddress;
  DetailCourse({
    required this.id,
    required this.name,
    required this.teachingContent,
    required this.day,
    required this.time,
    required this.teacherName,
    required this.phongHoc,
    required this.cosoName,
    required this.cosoAddress,
  });
  factory DetailCourse.fromJson(Map<String, dynamic> json) {
    return DetailCourse(
      id: json["id"] ?? '',
      name: json["name"] ?? '',
      teachingContent: json["teaching_content"] ?? '',
      day: DateFormat("yyyy-MM-dd").parse(json["day"] ?? ''),
      time: json["time"] ?? '',
      teacherName: json["teachers_full_name"] ?? '',
      phongHoc: json["phong_hoc"] ?? '',
      cosoName: json["coso_name"] ?? '',
      cosoAddress: json["coso_address"] ?? '',
    );
  }
}
