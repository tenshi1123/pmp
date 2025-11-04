import 'package:bloc/bloc.dart';
import 'package:pmp_english/services/socket_services.dart';
import 'socket_state.dart';

class SocketCubit extends Cubit<SocketState> {
  final SocketService _service = SocketService();

  SocketCubit() : super(const SocketState());

  Future<void> connect({
    required String site,
    required String role,
    required String userId,
  }) async {
    await _service.connect(site: site, role: role, userId: userId);

    emit(state.copyWith(connected: true));

    _service.stream.listen((data) {
      emit(state.copyWith(lastMessage: data));
    });
  }

  void send(Map<String, dynamic> data) {
    _service.send(data);
  }

  @override
  Future<void> close() {
    _service.dispose();
    return super.close();
  }
}
