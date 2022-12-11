part of 'pincode_screen_bloc.dart';

abstract class PincodeScreenEvent extends Equatable {
  const PincodeScreenEvent();

  @override
  List<Object> get props => [];
}

class PincodeScreenCheckStateEvent extends PincodeScreenEvent {}
