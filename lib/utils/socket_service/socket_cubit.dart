// socket_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'socket_service.dart';

/// States
abstract class SocketState {}

class SocketInitial extends SocketState {}

class SocketConnected extends SocketState {}

class SocketDisconnected extends SocketState {}

class SocketMessageReceived extends SocketState {
  final dynamic data;
  SocketMessageReceived(this.data);
}

/// Cubit
class SocketCubit extends Cubit<SocketState> {
  final SocketService _socketService = SocketService();

  SocketCubit() : super(SocketInitial());

  void connect({
    required String url,
    required Map<String, dynamic> registerPayload,
  }) {
    _socketService.connect(url: url, registerPayload: registerPayload);

    emit(SocketConnected());

    _socketService.stream.listen((event) {
      emit(SocketMessageReceived(event));
    }, onDone: () {
      emit(SocketDisconnected());
    }, onError: (_) {
      emit(SocketDisconnected());
    });
  }

  void send(dynamic data) {
    _socketService.send(data);
  }

  void disconnect() {
    _socketService.disconnect();
    emit(SocketDisconnected());
  }
}
