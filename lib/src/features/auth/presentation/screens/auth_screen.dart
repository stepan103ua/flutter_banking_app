import 'package:flutter/material.dart';
import 'package:flutter_banking/src/features/auth/presentation/widgets/auth_header.dart';
import 'package:flutter_banking/src/features/auth/presentation/widgets/auth_tab_bar.dart';
import 'package:flutter_banking/src/features/auth/presentation/widgets/login_tab_view/login_tab_view.dart';
import 'package:flutter_banking/src/features/auth/presentation/widgets/register_tab_view/register_tab_view.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              const AuthHeader(
                title: 'Welcome',
                fontSize: 30,
                padding: EdgeInsets.all(20),
              ),
              const AuthTabBar(),
              Expanded(
                child: TabBarView(
                  children: [
                    LoginTabView(),
                    RegisterTabView(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
