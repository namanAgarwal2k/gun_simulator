import 'package:flutter/material.dart';

class SparkTransitionWidget extends StatefulWidget {
  const SparkTransitionWidget({Key? key}) : super(key: key);

  @override
  State<SparkTransitionWidget> createState() => SparkTransitionWidgetState();
}

class SparkTransitionWidgetState extends State<SparkTransitionWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;
  bool isFire = false;
  bool isVisible = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 100));
    _animation = Tween<Offset>(
            begin: const Offset(1.0, 0.4), end: const Offset(-1.0, 0.4))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
  }

  @override
  void dispose() {
    _controller.removeStatusListener(_updateStatus);
    super.dispose();
  }

  void _updateStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _controller.reset();
      if (isFire) {
        _controller.forward();
      }
    }
  }

  void sparkFire() {
    print('object');
    setState(() {
      isVisible = true;
    });
    isFire = true;
    _controller.forward();
    _updateStatus(_controller.status);
    isFire = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Slide Transition',
        ),
      ),
      body: Visibility(
        visible: isVisible,
        child: SlideTransition(
          position: _animation,
          child: const Image(
            image: AssetImage('assets/guns/sparkNew.png'),
            height: 70,
            width: 110,
          ),
        ),
      ),
    );
  }
}
