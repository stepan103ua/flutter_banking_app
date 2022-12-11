import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bank_card_state.dart';

class BankCardCubit extends Cubit<BankCardState> {
  BankCardCubit() : super(BankCardNotVisible());

  void setVisible() async {
    emit(BankCardVisible());
    await Future.delayed(const Duration(seconds: 5));
    emit(BankCardNotVisible());
  }
}
