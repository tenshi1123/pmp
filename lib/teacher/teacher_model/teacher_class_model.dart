class TeacherClassModel {
  final List<ItemClassModel> zoom;
  final List<ItemClassModel> offl;
  TeacherClassModel({
    required this.zoom,
    required this.offl,
  });
  factory TeacherClassModel.fromJson(Map<String, dynamic> json) {
    return TeacherClassModel(
      zoom: (json['zoom'] as List)
          .map((data) => ItemClassModel.fromJson(data))
          .toList(),
      offl: (json['off'] as List)
          .map((data) => ItemClassModel.fromJson(data))
          .toList(),
    );
  }
}

class ItemClassModel {
  final String id;
  final String name;
  final String alias;
  final String dateStart;
  final String dateEnd;
  ItemClassModel({
    required this.id,
    required this.name,
    required this.alias,
    required this.dateStart,
    required this.dateEnd,
  });
  factory ItemClassModel.fromJson(Map<String, dynamic> json) {
    return ItemClassModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      alias: json['alias'] ?? '',
      dateStart: json['date_start'] ?? '',
      dateEnd: json['date_end'] ?? '',
    );
  }
}

class DetailClass {
  final String hinhThucHoc;
  final String id;
  final String name;
  final String alias;
  final String settingCourseTypeId;
  final List<DetailBuoiHoc> dsBuoiHoc;
  DetailClass({
    required this.hinhThucHoc,
    required this.id,
    required this.name,
    required this.alias,
    required this.settingCourseTypeId,
    required this.dsBuoiHoc,
  });
  factory DetailClass.fromJson(Map<String, dynamic> json) {
    return DetailClass(
      hinhThucHoc: json['courseSchedule']['hinh_thuc_hoc'] ?? '',
      id: json['courseSchedule']['id'] ?? '',
      name: json['courseSchedule']['name'] ?? '',
      alias: json['courseSchedule']['alias'] ?? '',
      settingCourseTypeId:
          json['courseSchedule']['setting_course_type_id'] ?? '',
      dsBuoiHoc: (json['danh_sach_buoi_hoc'] as List)
          .map((data) => DetailBuoiHoc.fromJson(data))
          .toList(),
    );
  }
}

class DetailBuoiHoc {
  final String id;
  final String name;
  final String teachingContent;
  final DateTime day;
  final String timeStart;
  final String timeEnd;
  final String classRoomName;
  final String address;
  DetailBuoiHoc({
    required this.id,
    required this.name,
    required this.teachingContent,
    required this.day,
    required this.timeStart,
    required this.timeEnd,
    required this.classRoomName,
    required this.address,
  });
  factory DetailBuoiHoc.fromJson(Map<String, dynamic> json) {
    return DetailBuoiHoc(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      teachingContent: json['teaching_content'] ?? '',
      day: DateTime.parse(json['day']),
      timeStart: json['time_start'] ?? '',
      timeEnd: json['time_end'] ?? '',
      classRoomName: json['class_room_name'] ?? '',
      address: json['coso_address'] ?? '',
    );
  }
}

class DiemDanhHSModel {
  final String name;
  final String status;
  DiemDanhHSModel({
    required this.name,
    required this.status,
  });
  factory DiemDanhHSModel.fromJson(Map<String, dynamic> json) {
    return DiemDanhHSModel(
      name: json['full_name'] ?? '',
      status: json['ccs_status'] ?? '',
    );
  }
}
