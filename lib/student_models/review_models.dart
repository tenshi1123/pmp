class ReviewModels {
  final String id;
  final String monthName;
  final String months;
  final String teacherName;
  final String courseName;
  final String alias;
  ReviewModels({
    required this.id,
    required this.monthName,
    required this.months,
    required this.teacherName,
    required this.courseName,
    required this.alias,
  });
  factory ReviewModels.fromJson(Map<String, dynamic> json) {
    return ReviewModels(
      id: json['id'] ?? '',
      monthName: json['evaluation_month_name'] ?? '',
      months: json['months'] ?? '',
      teacherName: json['teachers_full_name'] ?? '',
      courseName: json['course_schedule_name'] ?? '',
      alias: json['alias'] ?? '',
    );
  }
}

class ReviewDetailModels {
  final String monthName;
  final String months;
  final String teacherName;
  final String courseName;
  final String alias;
  final String content;
  final String id;
  final String cc;
  final String bt;
  final List<ValueModel> listValue;
  ReviewDetailModels({
    required this.monthName,
    required this.months,
    required this.teacherName,
    required this.courseName,
    required this.alias,
    required this.content,
    required this.id,
    required this.cc,
    required this.bt,
    required this.listValue,
  });
  factory ReviewDetailModels.fromJson(Map<String, dynamic> json) {
    return ReviewDetailModels(
      id: json['id'] ?? '',
      monthName: json['evaluation_month_name'] ?? '',
      months: json['months'] ?? '',
      teacherName: json['teachers_full_name'] ?? '',
      courseName: json['course_schedule_name'] ?? '',
      alias: json['alias'] ?? '',
      content: json['content'] ?? '',
      cc: json['cc'] ?? '',
      bt: json['bt'] ?? '',
      listValue: (json['value'] as List)
          .map((item) => ValueModel.fromJson(item))
          .toList(),
      // json['list_value']
      // .map<ValueModel>((item) => ValueModel.fromJson(item))
      // .toList() ?? [],
    );
  }
}

class ValueModel {
  final String name;
  final String type;
  final String value;
  ValueModel({
    required this.name,
    required this.type,
    required this.value,
  });
  factory ValueModel.fromJson(Map<String, dynamic> json) {
    return ValueModel(
      name: json['name'] ?? '',
      type: json['type'] ?? '',
      value: json['value'] ?? '',
    );
  }
}
