import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BarPainter extends CustomPainter{
  static const barWidth=40.0;
  final Animation<Bar> animation;

  const BarPainter(Animation<Bar> animation)
      : animation = animation,
        super(repaint: animation);


@override
  void addListener(listener) {


  }

  @override
  void paint(Canvas canvas, Size size) {
   final paint=Paint()
       ..color=Colors.brown.withOpacity(0.7)
       ..style=PaintingStyle.fill;
    final randomVal=Random();
    int height=size.height.toInt();

    if(animation.status!=AnimationStatus.completed){
      height=randomVal.nextInt(size.height.toInt());
    }

   canvas.drawRect(Rect.fromLTWH(
       (size.width-barWidth)/2,
       size.height-height,
       barWidth,
       height.toDouble()), paint);
  }

  @override
  bool shouldRepaint(BarPainter oldDelegate) {
//    return oldDelegate.animation.value.height.toInt()!=
//    this.animation.value.height.toInt();
  return false;
  }
}


class Bar{
  final double height;
  Bar({@required this.height}):assert(height!=null);

  static Bar lerp(Bar begin,Bar end,double t){
     return Bar(height: lerpDouble(begin.height, end.height, t));
  }
}


class BarTween extends Tween<Bar> {
  BarTween(Bar begin, Bar end) : super(begin: begin, end: end);

  @override
  Bar lerp(double t) => Bar.lerp(begin, end, t);
}