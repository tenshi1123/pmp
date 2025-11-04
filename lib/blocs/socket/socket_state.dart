import 'package:equatable/equatable.dart';

class SocketState extends Equatable {
  final bool connected;
  final Map<String, dynamic>? lastMessage;

  const SocketState({
    this.connected = false,
    this.lastMessage,
  });

  SocketState copyWith({
    bool? connected,
    Map<String, dynamic>? lastMessage,
  }) {
    return SocketState(
      connected: connected ?? this.connected,
      lastMessage: lastMessage ?? this.lastMessage,
    );
  }

  @override
  List<Object?> get props => [connected, lastMessage];
}
