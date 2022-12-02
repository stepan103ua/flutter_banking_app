import 'package:flutter/material.dart';
import 'package:flutter_banking/src/core/enums/card_providers.dart';
import 'package:intl/intl.dart';

import '../bank_card_constants.dart';

class BankCardFooter extends StatelessWidget {
  const BankCardFooter(
      {super.key, required this.expirationDate, required this.cardProvider});

  final DateTime expirationDate;
  final CardProviders cardProvider;

  String expirationDateText(DateTime expirationDate) =>
      'Exp ${DateFormat('M/yy').format(expirationDate)}';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(expirationDateText(expirationDate), style: bankCardTextStyle),
        Icon(
          providerIcons[cardProvider],
          size: 40,
          color: Colors.white,
        ),
      ],
    );
  }
}
