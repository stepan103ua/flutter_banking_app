import 'package:flutter/material.dart';
import 'package:flutter_banking/src/features/auth/presentation/screens/create_password_screen.dart';
import 'package:flutter_banking/src/features/home_provider/presentation/home_provider.dart';

class AppRouter {
  static Map<String, Widget Function(BuildContext)> get routes => {
        AppRoutes.createPassword: (context) => const CreatePasswordScreen(),
        AppRoutes.homeProvider: (context) => const HomeProvider(),
      };
}

class AppRoutes {
  static String get createPassword => '/auth/createPassword';
  static String get homeProvider => '/';
}
