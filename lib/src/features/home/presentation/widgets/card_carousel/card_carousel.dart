import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_banking/src/features/home/presentation/bloc/home_screen_bloc/home_screen_bloc.dart';
import 'package:flutter_banking/src/features/home/presentation/widgets/bank_card/bank_card.dart';
import 'package:flutter_banking/src/features/home/presentation/widgets/bank_card/widgets/bank_card_placeholder.dart';
import 'package:flutter_banking/src/features/home/presentation/widgets/card_carousel/add_bank_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardCarousel extends StatelessWidget {
  const CardCarousel({super.key, required this.height});
  final double height;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenBloc, HomeScreenState>(
      builder: (context, state) {
        if (state is HomeScreenLoaded) {
          if (state.cards.isEmpty) {
            return AddBankCard(height: height);
          }
          return CarouselSlider.builder(
            itemCount: state.cards.length,
            itemBuilder: (context, index, realIndex) {
              final cardModel = state.cards[index];
              return BankCard(
                cardNumber: cardModel.cardNumber,
                expirationDate: cardModel.expirationTime,
                cardProvider: cardModel.cardProvider,
                cardType: cardModel.cardType,
              );
            },
            options: CarouselOptions(
              viewportFraction: 0.82,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              height: height,
            ),
          );
        }
        return BankCardPlaceholder(
          height: height,
          width: height / 0.6,
        );
      },
    );
  }
}
