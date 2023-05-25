import 'package:flutter/material.dart';
import 'package:gun_simulator/final_work/models/sine_curve.dart';
import 'package:gun_simulator/final_work/spark_widget.dart';
import 'models/animator_controller.dart';

class GunWidget extends StatefulWidget {
  const GunWidget({
    Key? key,
    required this.shakeOffset,
    this.shakeCount = 1,
    // this.shakeDuration = const Duration(seconds: 1),
  }) : super(key: key);

  final double shakeOffset;
  final int shakeCount;
  // final Duration shakeDuration;

  @override
  GunWidgetState createState() => GunWidgetState();
}

class GunWidgetState extends AnimationControllerState<GunWidget> {
  GunWidgetState() : super();
  bool isFire = false;
  bool isVisible = true;
  final _sparkWidgetKey = GlobalKey<SparkTransitionWidgetState>();

  late final Animation<double> _sineAnimation = Tween(
    begin: 0.0,
    end: 5.0,
  ).animate(CurvedAnimation(
    parent: gunAnimationController,
    curve: SineCurve(count: widget.shakeCount.toDouble()),
  ));

  @override
  void initState() {
    super.initState();
    gunAnimationController.addStatusListener(_updateStatus);
  }

  @override
  void dispose() {
    gunAnimationController.removeStatusListener(_updateStatus);
    super.dispose();
  }

  void _updateStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      gunAnimationController.reset();
      if (isFire) {
        gunAnimationController.forward();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          fire();
        },
      ),
      body: Stack(
        children: [
          SparkTransitionWidget(
            key: _sparkWidgetKey,
          ),
          AnimatedBuilder(
              animation: _sineAnimation,
              builder: (context, child) {
                return Positioned(
                  left: 120,
                  child: Transform.translate(
                    offset:
                        Offset(_sineAnimation.value * widget.shakeOffset, 0),
                    child: Container(
                      width: 600,
                      height: 400,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/guns/m16.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }

  void fire() {
    isFire = true;
    _sparkWidgetKey.currentState?.sparkFire();
    gunAnimationController.forward();
    isFire = false;
  }
}
