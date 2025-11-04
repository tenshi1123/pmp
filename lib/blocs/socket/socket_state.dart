part of 'socket_cubit.dart';

abstract class SocketState {}

class SocketInitial extends SocketState {}

class SocketConnecting extends SocketState {}

class SocketConnected extends SocketState {}

class SocketDisconnected extends SocketState {}

class SocketError extends SocketState {
  final String message;
  SocketError(this.message);
}

class SocketMessage extends SocketState {
  final dynamic message;
  SocketMessage(this.message);
}
