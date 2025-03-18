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
