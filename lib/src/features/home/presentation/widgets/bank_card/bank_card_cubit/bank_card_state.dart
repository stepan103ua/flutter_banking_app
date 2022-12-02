part of 'bank_card_cubit.dart';

abstract class BankCardState extends Equatable {
  const BankCardState();
  @override
  List<Object> get props => [];
}

class BankCardVisible extends BankCardState {}

class BankCardNotVisible extends BankCardState {}
