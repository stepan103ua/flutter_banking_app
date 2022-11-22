import 'package:flutter/material.dart';
import 'package:flutter_banking/src/core/blocs/auth_bloc/auth_bloc.dart';
import 'package:flutter_banking/src/core/config/routes.dart';
import 'package:flutter_banking/src/core/constants/colors.dart';
import 'package:flutter_banking/src/core/themes/app_bar_theme.dart';
import 'package:flutter_banking/src/features/auth/presentation/bloc/auth_screen_cubit/auth_screen_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
        BlocProvider(
          create: (context) => AuthScreenCubit(),
        ),
      ],
      child: MaterialApp(
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
      ),
    );
  }
}
