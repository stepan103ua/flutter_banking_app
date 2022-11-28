import 'package:flutter/material.dart';
import 'package:flutter_banking/src/core/widgets/shake_widget/shake_curve.dart';

import 'shake_animation_controller.dart';

class ShakeWidget extends StatefulWidget {
  const ShakeWidget({
    super.key,
    required this.child,
    required this.shakeOffset,
    this.shakeCount = 3,
  });

  final Widget child;
  final double shakeOffset;
  final int shakeCount;

  @override
  State<ShakeWidget> createState() => ShakeWidgetState();
}

class ShakeWidgetState extends AnimationControllerState<ShakeWidget> {
  late final Animation<double> _animation = Tween(
    begin: 0.0,
    end: 1.0,
    // 2. animate it with a CurvedAnimation
  ).animate(CurvedAnimation(
    parent: animationController,
    // 3. use our SineCurve
    curve: ShakeCurve(count: widget.shakeCount.toDouble()),
  ));

  void shake() {
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) => Transform.translate(
        offset: Offset(_animation.value * widget.shakeOffset, 0),
        child: child,
      ),
      child: widget.child,
    );
  }
}
