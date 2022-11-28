import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_banking/src/core/data/session_data_provider.dart';
import 'package:flutter_banking/src/core/widgets/shake_widget/shake_widget.dart';
import 'package:flutter_banking/src/features/auth/services/auth_service.dart';
import 'package:fluttertoast/fluttertoast.dart';

part 'pincode_state.dart';

class PincodeCubit extends Cubit<AbstractPincodeState> {
  PincodeCubit() : super(const PincodeState(pincode: ''));

  final shakeKey = GlobalKey<ShakeWidgetState>();
  final _authService = AuthService();

  void addDigit(String digit) {
    if (digit.isEmpty || digit.length > 1 || state.pincode.length >= 4) {
      return;
    }
    final newPincode = state.pincode + digit;
    emit(PincodeState(pincode: newPincode));
  }

  void deleteDigit() {
    if (state.pincode.isEmpty) {
      return;
    }

    String pincode = state.pincode;

    pincode = pincode.substring(0, pincode.length - 1);

    emit(PincodeState(pincode: pincode));
  }

  Future<bool> checkIfCorrect() async {
    if (!(await _authService.checkPincode(state.pincode))) {
      if (shakeKey.currentState != null) {
        shakeKey.currentState!.shake();
      }
      return false;
    }

    return true;
  }

  Future<void> savePincode() async {
    emit(PincodeSavingState(pincode: state.pincode));
    await SessionDataProvider().savePincode(state.pincode);
  }

  Future<void> refreshToken() async {
    final String? errorMessage = await _authService.refreshToken();

    if (errorMessage == null) {
      return;
    }

    Fluttertoast.showToast(msg: errorMessage);
  }
}
