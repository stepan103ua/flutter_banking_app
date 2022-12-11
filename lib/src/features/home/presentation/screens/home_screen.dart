import 'package:flutter/material.dart';
import 'package:flutter_banking/src/core/constants/constants.dart';
import 'package:flutter_banking/src/features/home/presentation/bloc/cubit/home_bottom_app_bar_cubit.dart';
import 'package:flutter_banking/src/features/home/presentation/bloc/home_screen_bloc/home_screen_bloc.dart';
import 'package:flutter_banking/src/features/home/presentation/widgets/home_screen/home_app_bar.dart';
import 'package:flutter_banking/src/features/home/presentation/widgets/home_screen/home_floating_action_button.dart';
import 'package:flutter_banking/src/features/home/presentation/widgets/home_screen/navigation_tabs/home_tab.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/home_screen/home_bottom_navigation_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const _screens = {
    HomeScreenAppBarState.home: HomeTab(),
    HomeScreenAppBarState.expenses: HomeTab(),
    HomeScreenAppBarState.cards: HomeTab(),
    HomeScreenAppBarState.profile: HomeTab(),
  };

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final width = mediaQuery.size.width;
    final horizontalPadding = width * 0.09;
    final appBarHorizontalPadding = horizontalPadding - 12;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBottomAppBarCubit(),
        ),
        BlocProvider(
          create: (context) => HomeScreenBloc()..add(HomeScreenLoadEvent()),
        ),
      ],
      child: BlocBuilder<HomeBottomAppBarCubit, HomeScreenAppBarState>(
        builder: (context, state) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(kAppBarHeight),
              child: HomeAppBar(
                horizontalPadding: appBarHorizontalPadding,
              ),
            ),
            drawer: const Drawer(),
            body: _screens[state],
            bottomNavigationBar: HomeBottomNavigationBar(state: state),
            floatingActionButton: const HomeFloatingActionButton(),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
          );
        },
      ),
    );
  }
}
