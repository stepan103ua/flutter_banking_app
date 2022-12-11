import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key, required this.horizontalPadding, this.title});
  final double horizontalPadding;
  final String? title;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: Scaffold.of(context).openDrawer,
              icon: const Icon(Icons.menu_rounded),
              iconSize: 30,
              splashRadius: 24,
            ),
            if (title != null)
              Text(
                title!,
                style: const TextStyle(fontSize: 17),
              ),
            IconButton(
              onPressed: () => {},
              icon: const Icon(Icons.notifications_rounded),
              splashRadius: 24,
              iconSize: 30,
            ),
          ],
        ),
      ),
    );
  }
}
