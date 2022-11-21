import 'package:flutter/material.dart';

class AuthTabBarItem extends StatelessWidget {
  const AuthTabBarItem({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Tab(
      iconMargin: EdgeInsets.zero,
      child: Container(
        width: 125,
        alignment: Alignment.center,
        child: Text(
          title,
        ),
      ),
    );
  }
}
