import 'package:equatable/equatable.dart';
import 'package:pmp_english/student_models/customer_models.dart';
import 'package:pmp_english/student_models/profile_model.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final StudentHomeModel infoModel;
  final ProfileModel profileModel;

  const LoginSuccess({required this.infoModel, required this.profileModel});

  @override
  List<Object?> get props => [infoModel, profileModel];
}

class LoginFailure extends LoginState {
  final String error;

  const LoginFailure({required this.error});

  @override
  List<Object?> get props => [error];
}
