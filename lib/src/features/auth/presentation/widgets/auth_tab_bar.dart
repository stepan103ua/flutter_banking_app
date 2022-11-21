import 'package:flutter/material.dart';
import 'package:flutter_banking/src/features/auth/presentation/widgets/auth_tab_bar_item.dart';

class AuthTabBar extends StatelessWidget {
  const AuthTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      alignment: Alignment.centerLeft,
      child: TabBar(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.black,
          indicatorColor: Colors.transparent,
          padding: EdgeInsets.zero,
          indicatorPadding: EdgeInsets.zero,
          labelPadding: EdgeInsets.zero,
          splashBorderRadius: BorderRadius.circular(30),
          indicator: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(30),
          ),
          tabs: const [
            AuthTabBarItem(title: 'Login'),
            AuthTabBarItem(title: 'Register'),
          ]),
    );
  }
}
