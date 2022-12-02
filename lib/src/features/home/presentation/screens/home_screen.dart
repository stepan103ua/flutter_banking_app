import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_banking/src/features/home/presentation/widgets/card_carousel/card_carousel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  double _getCarouselHeight(double width) => width * 0.83 * 0.6;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) => Column(
            children: [
              const Text('Home'),
              CardCarousel(
                height: _getCarouselHeight(constraints.maxWidth),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
