import 'package:flutter/material.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({
    super.key,
    required this.title,
    required this.fontSize,
    this.padding,
    this.alignment,
    this.color,
  });

  final String title;
  final double fontSize;
  final Alignment? alignment;
  final EdgeInsets? padding;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      alignment: alignment ?? Alignment.centerLeft,
      child: Text(
        title,
        style: TextStyle(
          color: color ?? Theme.of(context).primaryColor,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
