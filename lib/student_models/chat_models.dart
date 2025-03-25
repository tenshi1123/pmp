class ChatModel {
  final String teacherId;
  final String fullName;
  final String content;

  ChatModel({
    required this.teacherId,
    required this.fullName,
    required this.content,
  });
  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      teacherId: json['teachers_id'] ?? '',
      fullName: json['full_name'] ?? '',
      content: json['content'] ?? '',
    );
  }
}
