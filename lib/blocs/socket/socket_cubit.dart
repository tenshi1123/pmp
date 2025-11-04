import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:http/http.dart' as http;

part 'socket_state.dart';

class SocketCubit extends Cubit<SocketState> {
  WebSocketChannel? _channel;

  SocketCubit() : super(SocketInitial());

  Future<void> connect({
    required String site,
    required String role,
    required String userId,
  }) async {
    emit(SocketConnecting());

    try {
      // 1️⃣ Lấy token từ API
      final tokenResponse = await http.get(
        Uri.parse(
          "https://lms.pmpenglish.edu.vn/auth/token?site=$site&role=$role&userId=$userId",
        ),
      );

      if (tokenResponse.statusCode != 200) {
        emit(SocketError("Không thể lấy token (${tokenResponse.statusCode})"));
        return;
      }

      final tokenData = jsonDecode(tokenResponse.body);
      final token = tokenData["token"];
      if (token == null) {
        emit(SocketError("Token không hợp lệ"));
        return;
      }

      // 2️⃣ Kết nối WebSocket
      _channel = WebSocketChannel.connect(Uri.parse('wss://ws.hvgcloud.net'));

      _channel!.sink.add(jsonEncode({
        "event": "register",
        "site": site,
        "type": role, // user, customer, teachers
        "id": userId,
        "token": token,
      }));

      // 3️⃣ Lắng nghe dữ liệu
      _channel!.stream.listen(
        (data) {
          final decoded = jsonDecode(data);
          emit(SocketMessage(decoded));
        },
        onDone: () => emit(SocketDisconnected()),
        onError: (error) => emit(SocketError(error.toString())),
      );

      emit(SocketConnected());
    } catch (e) {
      emit(SocketError(e.toString()));
    }
  }

  void send(Map<String, dynamic> data) {
    if (_channel != null) {
      _channel!.sink.add(jsonEncode(data));
    }
  }

  void disconnect() {
    _channel?.sink.close();
    emit(SocketDisconnected());
  }

  @override
  Future<void> close() {
    _channel?.sink.close();
    return super.close();
  }
}
