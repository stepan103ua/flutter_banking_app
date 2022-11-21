import 'package:flutter/material.dart';
import 'package:flutter_banking/src/core/data/session_data_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () async {
              await SessionDataProvider().logout();
              Navigator.of(context).pushReplacementNamed('/');
            },
            child: const Text('Log Out')),
      ),
    );
  }
}
