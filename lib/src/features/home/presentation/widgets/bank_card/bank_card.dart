import 'package:flutter/material.dart';
import 'package:flutter_banking/src/core/enums/card_providers.dart';
import 'package:flutter_banking/src/core/enums/card_types.dart';
import 'package:flutter_banking/src/features/home/presentation/widgets/bank_card/bank_card_cubit/bank_card_cubit.dart';
import 'package:flutter_banking/src/features/home/presentation/widgets/bank_card/widgets/bank_card_footer.dart';
import 'package:flutter_banking/src/features/home/presentation/widgets/bank_card/widgets/bank_card_number.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bank_card_constants.dart';

class BankCard extends StatelessWidget {
  const BankCard({
    super.key,
    required this.cardNumber,
    required this.expirationDate,
    required this.cardProvider,
    required this.cardType,
  });

  final String cardNumber;
  final DateTime expirationDate;
  final CardProviders cardProvider;
  final CardTypes cardType;

  String cardTypeText(CardTypes cardType) =>
      '${CardTypesStringTranslator(cardType).value} card';

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
    final bankCardCubit = BankCardCubit();

    return BlocProvider.value(
      value: bankCardCubit,
      child: InkWell(
        onLongPress: () => bankCardCubit.setVisible(),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                cardBlackBackground,
                cardGreyBackground,
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildFittedWidget(
                  constraints.maxHeight * 0.2,
                  Text(
                    'Flutter Bank',
                    style: bankCardTextStyle.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Spacer(),
                _buildFittedWidget(
                  constraints.maxHeight * 0.3,
                  BankCardNumber(cardNumber: cardNumber),
                ),
                _buildFittedWidget(
                  constraints.maxHeight * 0.15,
                  Text(
                    cardTypeText(cardType),
                    style: bankCardTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Spacer(),
                BankCardFooter(
                  expirationDate: expirationDate,
                  cardProvider: cardProvider,
                  height: constraints.maxHeight * 0.3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
