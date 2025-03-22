class ProfileModel {
  final String id;
  final String code;
  final String fullName;
  final String phone;
  final String email;
  final String dob;
  final String img;
  final String address;
  final String targetIelts;
  final int? totalCustomerScore;
  ProfileModel({
    required this.id,
    required this.code,
    required this.fullName,
    required this.phone,
    required this.email,
    required this.dob,
    required this.img,
    required this.address,
    required this.targetIelts,
    this.totalCustomerScore,
  });
  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'] ?? '',
      code: json['code'] ?? '',
      fullName: json['full_name'] ?? '',
      phone: json['phone'] ?? '',
      email: json['email'] ?? '',
      dob: json['dob'] ?? '',
      img: json['img'] ?? '',
      address: json['address'] ?? '',
      targetIelts: json['target_ielts'] ?? '',
      totalCustomerScore: json['total_customer_score'],
    );
  }
}

class PostModel {
  final String id;
  final String name;
  final String slug;
  final String categories;
  final String img;
  final DateTime postDate;

  PostModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.categories,
    required this.img,
    required this.postDate,
  });
  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
      categories: json['categories'] ?? '',
      img: json['img'] ?? '',
      postDate: DateTime.parse(json['post_date'] ?? ''),
    );
  }
}
