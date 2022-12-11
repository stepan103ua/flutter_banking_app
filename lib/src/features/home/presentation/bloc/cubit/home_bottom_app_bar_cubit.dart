import 'package:bloc/bloc.dart';

part 'home_bottom_app_bar_state.dart';

class HomeBottomAppBarCubit extends Cubit<HomeScreenAppBarState> {
  HomeBottomAppBarCubit() : super(HomeScreenAppBarState.home);

  void setState(HomeScreenAppBarState newScreenState) {
    if (state == newScreenState) return;
    emit(newScreenState);
  }
}
