import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_banking/src/core/data/session_data_provider.dart';

part 'pincode_screen_event.dart';
part 'pincode_screen_state.dart';

class PincodeScreenBloc extends Bloc<PincodeScreenEvent, PincodeScreenState> {
  final _sessionDataProvider = SessionDataProvider();
  PincodeScreenBloc() : super(PincodeScreenLoading()) {
    on<PincodeScreenCheckStateEvent>((event, emit) async {
      final pincode = await _sessionDataProvider.pincode;
      emit(pincode == null ? PincodeScreenCreate() : PincodeScreenLogin());
    });
  }
}
