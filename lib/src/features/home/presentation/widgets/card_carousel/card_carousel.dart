import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_banking/src/core/enums/card_providers.dart';
import 'package:flutter_banking/src/core/enums/card_types.dart';
import 'package:flutter_banking/src/features/home/presentation/widgets/bank_card/bank_card.dart';

class CardCarousel extends StatelessWidget {
  CardCarousel({super.key, required this.height});
  final double height;
  final cards = [
    BankCard(
      cardNumber: '1234567890123456',
      expirationDate: DateTime.now(),
      cardProvider: CardProviders.visa,
      cardType: CardTypes.credit,
    ),
    BankCard(
      cardNumber: '1234567890123456',
      expirationDate: DateTime.now(),
      cardProvider: CardProviders.mastercard,
      cardType: CardTypes.debit,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: cards.length,
      itemBuilder: (context, index, realIndex) => cards[index],
      options: CarouselOptions(
        viewportFraction: 0.82,
        enlargeCenterPage: true,
        enableInfiniteScroll: false,
        height: height,
      ),
    );
  }
}
