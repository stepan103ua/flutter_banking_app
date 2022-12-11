import 'package:flutter/material.dart';

class HomeFloatingActionButton extends StatelessWidget {
  const HomeFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(53, 68, 207, 0.25),
              offset: Offset(0, 12),
              blurRadius: 30,
            )
          ]),
      child: FloatingActionButton(
        onPressed: () {},
        elevation: 0,
        highlightElevation: 0,
        child: const Icon(Icons.send_rounded),
      ),
    );
  }
}
