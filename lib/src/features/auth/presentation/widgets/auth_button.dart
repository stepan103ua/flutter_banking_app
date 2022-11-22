import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth_screen_cubit/auth_screen_cubit.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({super.key, required this.title, required this.onPress});
  final String title;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthScreenCubit, AuthScreenState>(
      builder: (context, authScreenState) {
        if (authScreenState is AuthScreenLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ElevatedButton(
          onPressed: onPress,
          child: Text(title),
        );
      },
    );
  }
}
