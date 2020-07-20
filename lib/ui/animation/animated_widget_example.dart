import 'dart:math';

import 'package:create/ui/util/util_ui.dart';
import 'package:flutter/material.dart';

class AnimatedWidgetExample extends StatefulWidget {
  const AnimatedWidgetExample({Key key}):super(key:key);
  @override
  _AnimatedWidgetExampleState createState() => _AnimatedWidgetExampleState();
}

class _AnimatedWidgetExampleState extends State<AnimatedWidgetExample>  with SingleTickerProviderStateMixin{
  AnimationController _animationController;

  @override
  void initState(){
    super.initState();
    _animationController=AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose(){
    super.dispose();
    _animationController?.dispose();
  }


  void resetAnimation(){
    _animationController.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: UtilUI.appBar(context, "AnimatedWidget"),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                child: SpinningContainer(animationController: _animationController)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                    child: Text("Start"),
                    onPressed:()=>_animationController.repeat()),

                RaisedButton(
                    child: Text("Reset"),
                    onPressed:(){
                      _animationController.reverse();
                    }),
                RaisedButton(
                    child: Text("Stop"),
                    onPressed: resetAnimation),
              ],
            ),
          ],
        ),

    );
  }
}

class SpinningContainer extends AnimatedWidget {
  const SpinningContainer({Key key,AnimationController animationController}):
        super(key:key,listenable:animationController);



  Animation get animationController => listenable;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(angle: animationController.value*2*pi,
    child: Container(
      height:MediaQuery.of(context).size.height/3,
      width: MediaQuery.of(context).size.width/1.5,
      color: Colors.red,
    ),
    );
  }
}

