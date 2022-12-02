import 'package:flutter/material.dart';
import 'package:flutter_banking/src/features/home/presentation/widgets/bank_card/bank_card_cubit/bank_card_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bank_card_constants.dart';

class BankCardNumber extends StatelessWidget {
  const BankCardNumber({super.key, required this.cardNumber});
  final String cardNumber;

  String formatCardNumber(bool isVisible) {
    final List<String> parts = [];
    for (int i = 4; i <= cardNumber.length; i += 4) {
      parts.add(cardNumber.substring(i - 4, i));
    }
    if (!isVisible) {
      parts[1] = '****';
      parts[2] = '****';
    }
    return parts.join(' ');
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BankCardCubit, BankCardState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Text(
            formatCardNumber(state is BankCardVisible),
            style: bankCardTextStyle,
          ),
        );
      },
    );
  }
}
