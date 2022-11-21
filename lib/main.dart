import 'package:flutter/material.dart';
import 'package:flutter_banking/src/core/blocs/auth_bloc/auth_bloc.dart';
import 'package:flutter_banking/src/core/config/routes.dart';
import 'package:flutter_banking/src/core/constants/colors.dart';
import 'package:flutter_banking/src/core/themes/app_bar_theme.dart';
import 'package:flutter_banking/src/features/auth/presentation/screens/auth_screen.dart';
import 'package:flutter_banking/src/features/error/presentation/error_screen.dart';
import 'package:flutter_banking/src/features/home/presentation/screens/home_screen.dart';
import 'package:flutter_banking/src/features/loading/screens/loading_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: ConstantColors.blueMaterialColor,
        fontFamily: 'Roboto',
        appBarTheme: AppBarThemeDecoration.appBarTheme,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(
              const EdgeInsets.all(17),
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
        textTheme: const TextTheme(),
      ),
      routes: AppRouter.routes,
      home: BlocProvider(
        create: (context) => AuthBloc()..add(AuthCheckStatusEvent()),
        child: BlocBuilder<AuthBloc, AuthState>(
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
            return const ErrorScreen();
          },
        ),
      ),
    );
  }
}
