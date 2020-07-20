
import 'package:create/ui/util/painter_util/bar_painter.dart';
import 'package:flutter/material.dart';


class BarAnimation extends StatelessWidget {
  final Animation animation;
  const BarAnimation({Key key,@required this.animation}):
        assert(animation!=null),super(key:key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
      CustomPaint(
        painter: BarPainter(animation),
      ),

        CustomPaint(
          painter: BarPainter(animation),
        ),
        CustomPaint(
          painter: BarPainter(animation),
        ),
        CustomPaint(
          painter: BarPainter(animation),
        ),
        CustomPaint(
          painter: BarPainter(animation),
        ),
      ],
    );
  }
}



