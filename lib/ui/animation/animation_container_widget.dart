import 'dart:math';

import 'package:create/ui/util/util_ui.dart';
import 'package:flutter/material.dart';

class AnimationContainerWidget extends StatefulWidget {
  const AnimationContainerWidget({Key key}):super(key:key);
  @override
  _AnimationContainerWidgetState createState() => _AnimationContainerWidgetState();
}

class _AnimationContainerWidgetState extends State<AnimationContainerWidget> {
  double _width=50.0;
  double _height=50.0;
  Color _color=Colors.green;
  BorderRadiusGeometry _borderRadiusGeometry=BorderRadius.circular(10.0);

  void startAnimation(){
    final random=Random();
    setState(() {
      _width=random.nextInt(MediaQuery.of(context).size.width.toInt()).toDouble();
      _height=random.nextInt(MediaQuery.of(context).size.height.toInt()).toDouble();
      _color=Color.fromRGBO(random.nextInt(256), random.nextInt(256), random.nextInt(256), 1);
      _borderRadiusGeometry=BorderRadius.circular(random.nextInt(100).toDouble());
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UtilUI.appBar(context, "AnimatedContainer"),
      body: Align(
        alignment: Alignment.topCenter,
        child: AnimatedContainer(
          height: _height,
          width: _width,
          decoration: BoxDecoration(
              color: _color,
              borderRadius: _borderRadiusGeometry,
              gradient: LinearGradient(
                  colors: [_color, const Color(0xFF999999)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  tileMode:TileMode.repeated,

              )
          ),
          duration: Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
          onPressed: startAnimation,
          child: Icon(Icons.play_arrow),
      ),
    );
  }
}
