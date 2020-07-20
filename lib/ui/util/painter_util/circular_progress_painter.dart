

import 'package:flutter/cupertino.dart';

class CircularProgressPainter extends CustomPainter{
  final double progressValue;
  final Color foreGroundColor;
  final double strokeWidth;
  CircularProgressPainter({
      @required this.progressValue,
      @required this.foreGroundColor,
      this.strokeWidth=4,
     }):assert(progressValue!=null&&foreGroundColor!=null);

  @override
  void paint(Canvas canvas, Size size) {

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    final oldPainter=oldDelegate as CircularProgressPainter;

    return oldPainter.progressValue!=this.progressValue||
           oldPainter.foreGroundColor!=this.foreGroundColor;
  }
}
