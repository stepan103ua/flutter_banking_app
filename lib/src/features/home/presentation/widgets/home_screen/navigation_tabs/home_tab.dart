import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_banking/src/core/constants/constants.dart';

import '../../card_carousel/card_carousel.dart';
import '../../frequently_used_functions/frequently_used_functions.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  double _getCarouselHeight(double width) => width * 0.82 * 0.6;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final width = mediaQuery.size.width;
    final screenHeight =
        mediaQuery.size.height - mediaQuery.padding.top - kAppBarHeight;
    final horizontalPadding = width * 0.09;
    final heightWithoutCardCarousel = screenHeight - _getCarouselHeight(width);
    final frequentlyUsedFunctionsHeight =
        max(heightWithoutCardCarousel * 0.3, 150).toDouble();
    final spacingHeight = heightWithoutCardCarousel * 0.05;

    return SafeArea(
      child: Column(
        children: [
          CardCarousel(
            height: _getCarouselHeight(width),
          ),
          SizedBox(height: spacingHeight),
          FrequentlyUsedFunctions(
            height: frequentlyUsedFunctionsHeight,
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
            ),
          ),
        ],
      ),
    );
  }
}
