// socket_service.dart
import 'dart:convert';
import 'package:web_socket_channel/web_socket_channel.dart';

class SocketService {
  static final SocketService _instance = SocketService._internal();
  factory SocketService() => _instance;
  SocketService._internal();

  WebSocketChannel? _channel;

  void connect({
    required String url,
    required Map<String, dynamic> registerPayload,
  }) {
    _channel = WebSocketChannel.connect(Uri.parse(url));
    // Khi kết nối thành công => gửi register
    _channel?.sink.add(jsonEncode(registerPayload));
  }

  Stream get stream => _channel!.stream;

  void send(dynamic data) {
    if (_channel != null) {
      _channel!.sink.add(jsonEncode(data));
    }
  }

  void disconnect() {
    _channel?.sink.close();
    _channel = null;
  }
}
