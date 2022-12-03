import 'package:flutter/material.dart';
import 'package:flutter_banking/src/features/home/presentation/widgets/card_carousel/card_carousel.dart';
import 'package:flutter_banking/src/features/home/presentation/widgets/frequently_used_functions/frequently_used_functions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  double _getCarouselHeight(double width) => width * 0.82 * 0.6;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final width = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height - mediaQuery.padding.top - 60;
    final horizontalPadding = width * 0.09;
    final appBarHorizontalPadding = horizontalPadding - 12;
    final heightWithoutCardCarousel = screenHeight - _getCarouselHeight(width);
    final frequentlyUsedFunctionsHeight = heightWithoutCardCarousel * 0.3;
    final spacingHeight = heightWithoutCardCarousel * 0.05;

    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return Transform.translate(
            offset: Offset(appBarHorizontalPadding, 0),
            child: IconButton(
              onPressed: Scaffold.of(context).openDrawer,
              icon: const Icon(Icons.menu_rounded),
              splashRadius: 24,
            ),
          );
        }),
        actions: [
          Transform.translate(
            offset: Offset(-1 * appBarHorizontalPadding, 0),
            child: IconButton(
              onPressed: () => {},
              icon: const Icon(Icons.notifications_rounded),
              splashRadius: 24,
            ),
          ),
        ],
      ),
      drawer: const Drawer(),
      body: SafeArea(
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
      ),
    );
  }
}
