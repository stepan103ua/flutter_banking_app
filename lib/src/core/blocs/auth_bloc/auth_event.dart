part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthLogoutEvent extends AuthEvent {}

class AuthLoginEvent extends AuthEvent {}

class AuthCheckStatusEvent extends AuthEvent {}

class AuthRegisterEvent extends AuthEvent {
  final RegisterModel registerModel;

  const AuthRegisterEvent(this.registerModel);
}
