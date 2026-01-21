import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pmp_english/services/socket_services.dart';
import 'package:pmp_english/student_models/chat_models.dart';

abstract class SocketState {}

class SocketInitial extends SocketState {}

class SocketConnected extends SocketState {}

class SocketDisconnected extends SocketState {}

class SocketMessageReceived extends SocketState {
  final List<ChatMessageModel> messages;
  SocketMessageReceived(this.messages);
}

class SocketCubit extends Cubit<SocketState> {
  final SocketService _service = SocketService();

  SocketCubit() : super(SocketInitial());

  void connect({
    required String url,
    required Map<String, dynamic> payload,
  }) {
    _service.connect(url: url, registerPayload: payload);

    emit(SocketConnected());

    _service.stream.listen(
      (data) => emit(SocketMessageReceived(data)),
      onDone: () => emit(SocketDisconnected()),
      onError: (_) => emit(SocketDisconnected()),
    );
  }

  void send(dynamic data) {
    _service.send(data);
  }

  void disconnect() {
    _service.disconnect();
    emit(SocketDisconnected());
  }
}
