import 'package:flutter/material.dart';
import 'package:flutter_banking/src/features/auth/presentation/screens/pincode_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/blocs/auth_bloc/auth_bloc.dart';
import '../../auth/presentation/screens/auth_screen.dart';
import '../../error/presentation/error_screen.dart';
import '../../home/presentation/screens/home_screen.dart';
import '../../loading/screens/loading_screen.dart';

class HomeProvider extends StatelessWidget {
  const HomeProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is CheckingAuthStatus) {
          return const LoadingScreen();
        }
        if (state is Authenticated) {
          return const HomeScreen();
        }
        if (state is NotAuthenticated) {
          return const AuthScreen();
        }
        if (state is AuthSubmitExpecting) {
          return const PincodeScreen();
        }
        return const ErrorScreen();
      },
    );
  }
}
