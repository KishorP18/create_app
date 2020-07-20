import 'package:create/ui/util/util_ui.dart';
import 'package:flutter/material.dart';

class AnimatedPositionedWidget extends StatefulWidget {
  const AnimatedPositionedWidget({Key key}):super(key:key);
  @override
  _AnimatedPositionedWidgetState createState() => _AnimatedPositionedWidgetState();
}

class _AnimatedPositionedWidgetState extends State<AnimatedPositionedWidget> {
  bool _isAnimated=false;
  double _left=50.0;
  double _right=50.0;
  double _top=50.0;
  double _bottom=50.0;

  void onPressed(){
    setState(() {
      _isAnimated^=true;
      _left=_isAnimated?100.0:50.0;
      _right=_isAnimated?40.0:50.0;
      _top=_isAnimated?10.0:50.0;
      _bottom=_isAnimated?40.0:50.0;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UtilUI.appBar(context, "AnimatedPositionedWidget"),
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0,left: 12.0,right: 12.0),
        child: Column(
          children: <Widget>[
            Container(
              height: 320.0,
              color: Colors.yellow,
             // width: 200.0,
              child: Stack(
                children: <Widget>[
                  AnimatedPositioned(
                     duration: const Duration(milliseconds: 1500),
                       left: _left,
                       right: _right,
                       bottom: _bottom,
                       top: _top,
                       curve: Curves.ease,
                      child: Container(
                      color: Colors.red,

                  ),),


                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            RaisedButton(
              child:  Text("Click Here to Animate Position"),
              onPressed: onPressed,
            ),
          ],
        ),
      ),

    );
  }
}
