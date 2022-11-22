import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_mode_state.dart';

class LoginModeCubit extends Cubit<LoginModeState> {
  LoginModeCubit() : super(LoginPhoneMode());

  void changeMode(LoginModeState newMode) {
    if (newMode == state) {
      return;
    }
    emit(newMode);
  }
}
