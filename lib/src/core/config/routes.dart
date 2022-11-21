import 'package:flutter/material.dart';
import 'package:flutter_banking/src/features/auth/presentation/screens/create_password_screen.dart';

class AppRouter {
  static Map<String, Widget Function(BuildContext)> get routes => {
        AppRoutes.createPassword: (context) => const CreatePasswordScreen(),
      };
}

class AppRoutes {
  static String get createPassword => '/auth/createPassword';
}
