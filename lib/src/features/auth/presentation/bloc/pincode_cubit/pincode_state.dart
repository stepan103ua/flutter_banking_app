part of 'pincode_cubit.dart';

abstract class AbstractPincodeState extends Equatable {
  const AbstractPincodeState({required this.pincode});
  final String pincode;
  @override
  List<Object> get props => [pincode];
}

class PincodeState extends AbstractPincodeState {
  const PincodeState({required super.pincode});
}

class PincodeSavingState extends AbstractPincodeState {
  const PincodeSavingState({required super.pincode});
}
