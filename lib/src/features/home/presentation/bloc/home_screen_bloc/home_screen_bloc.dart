import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_banking/src/core/errors/failure.dart';
import 'package:flutter_banking/src/features/home/models/card_model.dart';
import 'package:flutter_banking/src/features/home/services/card_service.dart';
import 'package:fluttertoast/fluttertoast.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  final CardService _cardService = CardService();

  HomeScreenBloc() : super(HomeScreenLoading()) {
    on<HomeScreenLoadEvent>((event, emit) async {
      emit(HomeScreenLoading());

      final result = await _cardService.allCards;

      Failure resultFailure = Failure("");
      List<CardModel> resultCards = [];

      result.fold(
        (failure) => resultFailure = failure,
        (cards) => resultCards = cards,
      );

      if (result.isLeft()) {
        Fluttertoast.showToast(msg: resultFailure.message);
        emit(HomeScreenError(resultFailure.message));
        return;
      }

      emit(HomeScreenLoaded(cards: resultCards));
    });
  }
}
