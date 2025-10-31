import 'dart:convert';

class QuestionGroupModel {
  final String id;
  final String examDetailQuestionId;
  final String title;
  final String content;
  final String videoAttachment;
  final String audioAttachment;
  final String questions;
  final String type;
  final String answer;
  final Map<String, SubQuestionModel> value;

  QuestionGroupModel({
    required this.id,
    required this.examDetailQuestionId,
    required this.title,
    required this.content,
    required this.videoAttachment,
    required this.audioAttachment,
    required this.questions,
    required this.type,
    required this.answer,
    required this.value,
  });

  factory QuestionGroupModel.fromJson(Map<String, dynamic> json) {
    Map<String, SubQuestionModel> parsedValue = {};

    final rawValue = json['value'];

    if (rawValue is Map<String, dynamic>) {
      // ✅ Trường hợp là Map (như ví dụ bạn vừa gửi)
      parsedValue = rawValue.map(
        (key, val) => MapEntry(key, SubQuestionModel.fromJson(val)),
      );
    } else if (rawValue is List) {
      // ✅ Trường hợp là List
      for (var i = 0; i < rawValue.length; i++) {
        parsedValue[i.toString()] = SubQuestionModel.fromJson(rawValue[i]);
      }
    }
    return QuestionGroupModel(
      id: json['id'] ?? '',
      examDetailQuestionId: json['exam_detail_question_id'] ?? '',
      title: json['title'] ?? '',
      content: json['content'] ?? '',
      videoAttachment: json['video_attachment'] ?? '',
      audioAttachment: json['audio_attachment'] ?? '',
      questions: json['questions'] ?? '',
      type: json['type'] ?? '',
      answer: json['answer'] ?? '',
      value: parsedValue,
    );
  }
}

class SubQuestionModel {
  final String id;
  final String examDetailQuestionId;
  final String title;
  final String content;
  final String mark;
  final String? videoAttachment;
  final String? audioAttachment;
  final List<QuestionChoice> choices;
  final String type;
  final String answer;
  final String? answerSolutions;
  final String? answerLoiGiai;
  SubQuestionModel({
    required this.id,
    required this.examDetailQuestionId,
    required this.title,
    required this.content,
    required this.mark,
    required this.videoAttachment,
    required this.audioAttachment,
    required this.choices,
    required this.type,
    required this.answer,
    this.answerSolutions,
    this.answerLoiGiai,
  });

  factory SubQuestionModel.fromJson(Map<String, dynamic> json) {
    final questionsRaw = json['questions'];
    List<QuestionChoice> parsedChoices = [];

    try {
      parsedChoices = (jsonDecode(questionsRaw) as List)
          .map((e) => QuestionChoice.fromJson(e))
          .toList();
    } catch (e) {
      // Nếu parse lỗi, để trống
      parsedChoices = [];
    }

    return SubQuestionModel(
      id: json['id'] ?? '',
      examDetailQuestionId: json['exam_detail_question_id'] ?? '',
      title: json['title'] ?? '',
      content: json['content'] ?? '',
      mark: json['mark'] ?? '0',
      videoAttachment: json['video_attachment'],
      audioAttachment: json['audio_attachment'],
      choices: parsedChoices,
      type: json['type'] ?? '',
      answer: json['answer'] ?? '',
      answerSolutions: json['answer_solutions'],
      answerLoiGiai: json['answer_loi_giai'],
    );
  }
}

class QuestionChoice {
  final String text;
  final int key;

  QuestionChoice({
    required this.text,
    required this.key,
  });

  factory QuestionChoice.fromJson(Map<String, dynamic> json) {
    return QuestionChoice(
      text: json['text'] ?? '',
      key: json['key'] ?? 0,
    );
  }
}
