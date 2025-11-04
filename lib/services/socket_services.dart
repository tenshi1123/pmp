import 'dart:async';
import 'dart:convert';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:http/http.dart' as http;

class SocketService {
  WebSocketChannel? _channel;
  StreamController<Map<String, dynamic>> streamController =
      StreamController.broadcast();

  Stream<Map<String, dynamic>> get stream => streamController.stream;

  Future<String?> _fetchToken({
    required String site,
    required String role,
    required String userId,
  }) async {
    try {
      final res = await http.get(Uri.parse(
        'https://lms.pmpenglish.edu.vn/auth/token?site=$site&role=$role&userId=$userId',
      ));
      if (res.statusCode == 200) {
        final jsonRes = jsonDecode(res.body);
        return jsonRes['token'];
      }
    } catch (e) {
      print("❌ Error fetching token: $e");
    }
    return null;
  }

  Future<void> connect({
    required String site,
    required String role,
    required String userId,
  }) async {
    final token = await _fetchToken(site: site, role: role, userId: userId);
    if (token == null) return;

    _channel = WebSocketChannel.connect(Uri.parse('wss://ws.hvgcloud.net'));

    _channel!.sink.add(jsonEncode({
      'event': 'register',
      'site': site,
      'type': role,
      'id': userId,
      'token': token,
    }));

    _channel!.stream.listen(
      (event) {
        try {
          final data = jsonDecode(event);
          streamController.add(data);
        } catch (e) {
          print('⚠️ Parse error: $e');
        }
      },
      onDone: () {
        print("❌ WS disconnected");
        _reconnect(site, role, userId);
      },
      onError: (error) {
        print("⚠️ WS error: $error");
        _reconnect(site, role, userId);
      },
    );
  }

  void _reconnect(String site, String role, String userId) {
    Future.delayed(const Duration(seconds: 2), () {
      connect(site: site, role: role, userId: userId);
    });
  }

  void send(Map<String, dynamic> data) {
    _channel?.sink.add(jsonEncode(data));
  }

  void dispose() {
    _channel?.sink.close();
    streamController.close();
  }
}
