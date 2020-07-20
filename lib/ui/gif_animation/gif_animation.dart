import 'package:create/ui/gif_animation/bar_animation.dart';
import 'package:create/ui/gif_animation/circular_progress_bar_animated.dart';
import 'package:create/ui/gif_animation/animated_slider.dart';
import 'package:create/ui/gif_animation/slider_animation.dart';
import 'package:create/ui/util/painter_util/bar_painter.dart';
import 'package:create/ui/util/util_ui.dart';
import 'package:flutter/material.dart';




class GifAnimation extends StatefulWidget {
  const GifAnimation({Key key}):super(key:key);
  @override
  _GifAnimationState createState() => _GifAnimationState();
}

class _GifAnimationState extends State<GifAnimation> with SingleTickerProviderStateMixin{
  AnimationController _animationController;
//  AnimationController _slideAnimationController;
  Animation _animation;
  BarTween _barTween=BarTween(Bar(height: 0.0),Bar(height:50.0));
  bool _isAnimationCompleted=false;

  @override
  void initState(){
    super.initState();
    _animationController=AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..forward();

//    _slideAnimationController=AnimationController(
//      vsync: this,
//      duration: const Duration(seconds: 10),
//    )..repeat();
//
   _animation=_barTween.animate(_animationController)
     ..addStatusListener((status) {
           if(status==AnimationStatus.completed){
                  setState(() {
                    _isAnimationCompleted=true;
                  });
           }
   });
//    ..addStatusListener((status) {
//      if(status==AnimationStatus.completed){
//        _slideAnimationController.stop();
//      }
//    });

  }





  @override
  void dispose(){
    _animationController?.dispose();
//    _slideAnimationController?.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UtilUI.appBar(context, "GIF Animation"),
      body:!_isAnimationCompleted?Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              SliderAnimation(animationController:_animationController,),
              CircularProgressBarAnimated(animationController:_animationController),
            ],
          ),
          SizedBox(height: 12.0,),

          AnimatedSlider(animationController: _animationController,),
          SizedBox(height: 12.0,),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height/2.5,
            child: BarAnimation(animation: _animation,),
          )
        ],
      ):Center(child: Text("Hello"),),

    );
  }
}
