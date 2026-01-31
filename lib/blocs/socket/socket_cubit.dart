import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pmp_english/services/socket_services.dart';
import 'package:pmp_english/student_models/chat_models.dart';
import 'package:pmp_english/student_repo/chat_repo.dart';

abstract class SocketState {}

class SocketInitial extends SocketState {}

class SocketConnected extends SocketState {}

class SocketDisconnected extends SocketState {}

class SocketLoading extends SocketState {}

class SocketLoaded extends SocketState {
  final List<ChatMessageModel> messages;
  SocketLoaded(this.messages);
}

class SocketMessageReceived extends SocketState {
  final List<ChatMessageModel> messages;
  SocketMessageReceived(this.messages);
}

class SocketCubit extends Cubit<SocketState> {
  final SocketService _service = SocketService();

  final List<ChatMessageModel> _messages = [];
  WebSocket? _socket;
  SocketCubit() : super(SocketInitial());

  Future<void> loadHistory(String chatId, String type) async {
    emit(SocketLoading());

    final data = type == 'teacher'
        ? await ChatRepo().getConversationDetailTeacher(chatId)
        : await ChatRepo().getConversationDetail(chatId);
    _messages
      ..clear()
      ..addAll(data.messages);

    emit(SocketLoaded(List.from(_messages)));
  }

  void connect({
    required String url,
    required Map<String, dynamic> payload,
  }) {
    _service.connect(url: url, registerPayload: payload);

    emit(SocketConnected());

    _service.stream.listen((data) {
      final msg = ChatMessageModel.fromJson(data);

      _messages.insert(0, msg); // thêm tin mới lên đầu

      emit(SocketMessageReceived(List.from(_messages)));
    });
  }

  void sendMessage(ChatMessageModel msg) {
    _service.send(msg.toJson());

    _messages.insert(0, msg);
    emit(SocketMessageReceived(List.from(_messages)));
  }
}
