import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_banking/src/core/data/session_data_provider.dart';
import 'package:flutter_banking/src/features/auth/models/register_model.dart';
import 'package:flutter_banking/src/features/auth/services/auth_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final _sessionDataProvider = SessionDataProvider();
  AuthBloc() : super(CheckingAuthStatus()) {
    on<AuthCheckStatusEvent>((event, emit) async {
      final isAuthenticated = await _sessionDataProvider.isAuthenticated;
      emit(isAuthenticated ? Authenticated() : NotAuthenticated());
    });
    on<AuthLogoutEvent>((event, emit) async {
      await _sessionDataProvider.logout();
      emit(NotAuthenticated());
    });
    on<AuthRegisterEvent>((event, emit) async {
      final authService = AuthService();

      await authService.register(event.registerModel);
    });
  }
}
