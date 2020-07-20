import 'dart:math';

import 'package:create/ui/util/util_ui.dart';
import 'package:flutter/material.dart';


class AnimationBuilderWidget extends StatefulWidget {
  const AnimationBuilderWidget({Key key}):super(key:key);
  @override
  _AnimationBuilderWidgetState createState() => _AnimationBuilderWidgetState();
}

class _AnimationBuilderWidgetState extends State<AnimationBuilderWidget> with SingleTickerProviderStateMixin{
  AnimationController _animationController;
  Animation _animation;

  @override
  void initState(){
    super.initState();
    _animationController=AnimationController(
        duration: Duration(milliseconds: 2200),
        vsync: this);
    _animation=Tween(
      begin: 100.0,
      end: 190.0,
    ).animate(_animationController);


    _animationController.addStatusListener((status) {
      if(status==AnimationStatus.completed){
        _animationController.repeat();
      }
    });
  }

  @override
  void dispose(){
    _animationController?.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UtilUI.appBar(context, "Animation Builder"),
      body: Center(
        child: ListView(
          primary: true,
          children: <Widget>[
            Container(
              height: 200.0,
              child: AnimatedBuilder(
                animation: _animationController,
                builder: (context,child){
                return  HeartWidget(_animation.value);
                },
              ),
            ),
            Container(
              height: 200.0,
              child: AnimatedBuilder(
                animation: _animationController,
                builder: (context,child){
                  return  Android(_animation.value);
                },
              ),
            ),

            SizedBox(height: 12.0,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(onPressed: (){
                  _animationController.isCompleted?_animationController.reverse():_animationController.forward();
                },child:Text("Start"),),

                RaisedButton(onPressed: (){
                  _animationController.stop();
                },

                  child:Text("Stop"),),
              ],
            ),

          ],
        ),
      ),
    );
  }
}


class HeartWidget extends StatelessWidget {
  num size;
  HeartWidget(this.size);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(Icons.favorite,color: Colors.red,size: size,),
    );
  }
}


class Android extends StatelessWidget {
  num size;
  Android(this.size);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(Icons.android,color: Colors.green,size: size,),
    );
  }
}



