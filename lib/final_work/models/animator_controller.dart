import 'package:flutter/material.dart';

abstract class AnimationControllerState<T extends StatefulWidget>
    extends State<T> with TickerProviderStateMixin {
  AnimationControllerState();

  // final Duration animationDuration;
  late final gunAnimationController = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 100));

  late final sparkAnimationController = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 100));

  @override
  void dispose() {
    gunAnimationController.dispose();
    sparkAnimationController.dispose();
    super.dispose();
  }
}
