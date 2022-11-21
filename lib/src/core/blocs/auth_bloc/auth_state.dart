part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class NotAuthenticated extends AuthState {}

class Authenticated extends AuthState {}

class CheckingAuthStatus extends AuthState {}
