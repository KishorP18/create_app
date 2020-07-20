import 'package:create/ui/util/util_ui.dart';
import 'package:flutter/material.dart';

class PositionTransitionWidget extends StatefulWidget {
  const PositionTransitionWidget({Key key}):super(key:key);
  @override
  _PositionTransitionWidgetState createState() => _PositionTransitionWidgetState();
}

class _PositionTransitionWidgetState extends State<PositionTransitionWidget> with
    SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<RelativeRect> _animation;
  bool _animationStatus=false;

  RelativeRectTween _relativeRect=RelativeRectTween(
    begin: RelativeRect.fromLTRB(10, 10, 90, 90),
    end: RelativeRect.fromLTRB(90, 90, 0, 0)
  );

  @override
  void initState(){
    super.initState();
    _animationController=AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200)
    );

    _animation=_relativeRect.animate(_animationController);
  }

  @override
  void dispose(){
    super.dispose();
    _animationController?.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UtilUI.appBar(context, "PositionedTransition"),
      body: ListView(
        primary: true,
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          Container(
            height: 300,
            color: Colors.blue[50],
            child: Stack(
              children: <Widget>[
                PositionedTransition(rect:_animation, child:FlutterLogo(
                  size: 200,
                ))
              ],
            ),
          ),

          SizedBox(
            height: 16.0,
          ),

          Center(
            child: RaisedButton(
                child: Text(
                  "Click Me!"
                ),
                onPressed: (){
                  _animationStatus^=true;
                  if(_animationStatus){
                    _animationController.forward();
                  }else{
                    _animationController.reverse();
                  }
                }),
          ),
        ],
      ),
    );
  }
}
