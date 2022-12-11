import 'package:flutter/material.dart';
import 'package:flutter_banking/src/core/constants/constants.dart';
import 'package:flutter_banking/src/features/home/presentation/bloc/cubit/home_bottom_app_bar_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBottomNavigationBar extends StatelessWidget {
  const HomeBottomNavigationBar({
    Key? key,
    required this.state,
  }) : super(key: key);
  final HomeScreenAppBarState state;

  Widget _buildIconButton(BuildContext context, IconData iconData,
      HomeScreenAppBarState screenState) {
    return IconButton(
      icon: Icon(iconData),
      color: state == screenState
          ? Theme.of(context).primaryColor
          : Colors.blueGrey.withOpacity(0.5),
      iconSize: 30,
      onPressed: () {
        BlocProvider.of<HomeBottomAppBarCubit>(context).setState(screenState);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 10,
      child: SizedBox(
        height: kBottomNavigationHeight,
        child: Row(
          //children inside bottom appbar
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,

          children: <Widget>[
            _buildIconButton(
                context, Icons.home_rounded, HomeScreenAppBarState.home),
            _buildIconButton(context, Icons.pie_chart_rounded,
                HomeScreenAppBarState.expenses),
            const SizedBox(),
            _buildIconButton(
                context, Icons.credit_card, HomeScreenAppBarState.cards),
            _buildIconButton(
                context, Icons.person, HomeScreenAppBarState.profile),
          ],
        ),
      ),
    );
  }
}
