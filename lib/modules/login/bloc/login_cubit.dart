import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pmp_english/modules/login/bloc/login_state.dart';
import 'package:pmp_english/student_repo/customer_repo.dart';
import 'package:pmp_english/student_repo/login_repo.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;
  final CustomerRepo customerRepo;

  LoginCubit({required this.loginRepo, required this.customerRepo}) : super(LoginInitial());

  Future<void> login(String phone, String password) async {
    emit(LoginLoading());
    try {
      final hashedPassword = md5.convert(utf8.encode(password)).toString();
      bool loggedIn = await loginRepo.login(phone, hashedPassword);
      
      if (loggedIn) {
        final infoModel = await customerRepo.getHomeInfo();
        final profileModel = await customerRepo.getCustomerProfile();
        
        if (infoModel != null) {
           emit(LoginSuccess(infoModel: infoModel, profileModel: profileModel));
        } else {
           emit(const LoginFailure(error: 'Failed to fetch user info.'));
        }
      } else {
        emit(const LoginFailure(error: 'Tài khoản hoặc mật khẩu không chính xác.'));
      }
    } catch (e) {
      emit(LoginFailure(error: e.toString()));
    }
  }
}
