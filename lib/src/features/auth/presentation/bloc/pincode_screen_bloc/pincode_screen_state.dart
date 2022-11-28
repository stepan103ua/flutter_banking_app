part of 'pincode_screen_bloc.dart';

abstract class PincodeScreenState extends Equatable {
  const PincodeScreenState();

  @override
  List<Object> get props => [];
}

class PincodeScreenLoading extends PincodeScreenState {}

class PincodeScreenCreate extends PincodeScreenState {}

class PincodeScreenLogin extends PincodeScreenState {}
