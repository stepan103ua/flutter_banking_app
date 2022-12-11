import 'package:flutter/material.dart';
import 'package:flutter_banking/src/core/constants/colors.dart';

class BankCardPlaceholder extends StatelessWidget {
  const BankCardPlaceholder(
      {super.key, required this.height, required this.width});
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ConstantColors.greyPlaceholder,
        borderRadius: BorderRadius.circular(20),
      ),
      height: height,
      width: width,
    );
  }
}
