import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_screen_state.dart';

class AuthScreenCubit extends Cubit<AuthScreenState> {
  AuthScreenCubit() : super(AuthScreenInitial());

  void loading(bool isLoading) {
    emit(isLoading ? AuthScreenLoading() : AuthScreenInitial());
  }
}
