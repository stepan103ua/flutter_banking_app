part of 'home_screen_bloc.dart';

abstract class HomeScreenState extends Equatable {
  const HomeScreenState();

  @override
  List<Object> get props => [];
}

class HomeScreenLoaded extends HomeScreenState {
  final List<CardModel> cards;
  const HomeScreenLoaded({required this.cards});

  @override
  List<Object> get props => [cards];
}

class HomeScreenLoading extends HomeScreenState {}

class HomeScreenError extends HomeScreenState {
  final String message;

  const HomeScreenError(this.message);
}
