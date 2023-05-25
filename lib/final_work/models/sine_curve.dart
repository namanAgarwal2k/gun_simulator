// 1. custom Curve subclass
import 'dart:math';

import 'package:flutter/animation.dart';

class SineCurve extends Curve {
  const SineCurve({this.count = 1});

  final double count;

  @override
  double transformInternal(double t) {
    return sin(count * 2 * pi * t);
  }
}
