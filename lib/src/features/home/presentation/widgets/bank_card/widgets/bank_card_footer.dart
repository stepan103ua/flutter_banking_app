import 'package:flutter/material.dart';
import 'package:flutter_banking/src/core/enums/card_providers.dart';
import 'package:intl/intl.dart';

import '../bank_card_constants.dart';

class BankCardFooter extends StatelessWidget {
  const BankCardFooter(
      {super.key,
      required this.expirationDate,
      required this.cardProvider,
      required this.height});

  final DateTime expirationDate;
  final CardProviders cardProvider;
  final double height;

  String expirationDateText(DateTime expirationDate) =>
      'Exp ${DateFormat('M/yy').format(expirationDate)}';

  Widget _buildFittedWidget(double height, Widget child) {
    return SizedBox(
      height: height,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildFittedWidget(
          height,
          Text(expirationDateText(expirationDate), style: bankCardTextStyle),
        ),
        _buildFittedWidget(
          height,
          Icon(
            providerIcons[cardProvider],
            size: 40,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
