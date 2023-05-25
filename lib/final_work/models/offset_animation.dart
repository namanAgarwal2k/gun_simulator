import 'package:flutter/material.dart ';

class OffsetAnimation extends AnimatedWidget{
  final double end;
  final Widget widget;
  final AnimationController animationController;


  OffsetAnimation({super.key, required this.end, required this.widget, required this.animationController}) : super(
    listenable: Tween<double>(begin: 0,end: end).chain(CurveTween(curve: Curves.elasticIn)).animate(animationController)..addStatusListener((status) {
      if(status == AnimationStatus.completed){
        animationController.reverse();
      }
    })
  );

  @override
  Widget build(BuildContext context) {
    final Animation animation = listenable as Animation<double>;
    return AnimatedBuilder(
        animation: animation,
         builder: (context,child){
      return Container(
        padding: EdgeInsets.only(left: animation.value,right: animation.value),
        child: widget,
      );
    });
  }

}