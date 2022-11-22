import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/login_mode_cubit/login_mode_cubit.dart';

class LoginModeSelectorItem extends StatelessWidget {
  const LoginModeSelectorItem(
      {super.key, required this.title, required this.loginModeState});

  final String title;
  final LoginModeState loginModeState;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          BlocProvider.of<LoginModeCubit>(context).changeMode(loginModeState),
      borderRadius: BorderRadius.circular(30),
      child: BlocBuilder<LoginModeCubit, LoginModeState>(
        builder: (context, state) {
          final isSelected = state == loginModeState;
          return AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(vertical: 10),
            width: 75,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: isSelected ? Theme.of(context).primaryColor : null,
            ),
            child: Text(
              title,
              style: TextStyle(color: isSelected ? Colors.white : null),
            ),
          );
        },
      ),
    );
  }
}
