import 'dart:math';

import 'package:flutter/material.dart';

class ShakeCurve extends Curve {
  const ShakeCurve({this.count = 3});
  final double count;

  // 2. override transformInternal() method
  @override
  double transformInternal(double t) {
    return sin(count * 2 * pi * t);
  }
}
