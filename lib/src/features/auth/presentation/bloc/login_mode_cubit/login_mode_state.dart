part of 'login_mode_cubit.dart';

abstract class LoginModeState extends Equatable {
  const LoginModeState();

  @override
  List<Object> get props => [];
}

class LoginPhoneMode extends LoginModeState {}

class LoginIpnMode extends LoginModeState {}
