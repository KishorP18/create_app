import 'package:create/ui/util/util_ui.dart';
import 'package:flutter/material.dart';


class RotationTransitionWidget extends StatefulWidget {
  const RotationTransitionWidget({Key key}):super(key:key);
  @override
  _RotationTransitionWidgetState createState() => _RotationTransitionWidgetState();
}

class _RotationTransitionWidgetState extends State<RotationTransitionWidget> with
    SingleTickerProviderStateMixin{

  AnimationController _animationController;
  Animation _animation;
  CurveTween _curveTween=CurveTween(curve: Curves.easeInCirc);
  bool _animationStatus=false;

  @override
  void initState(){
    super.initState();
    _animationController=AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500)
    );

    _animation=_curveTween.animate(_animationController);
  }

  @override
  void dispose(){
    super.dispose();
    _animationController?.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UtilUI.appBar(context, "RotationTransition"),
      body: ListView(
        primary: true,
        children: <Widget>[
          Container(
            height: 300.0,
            child: RotationTransition(
              turns: _animation,
              child: FlutterLogo(),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                onPressed: (){
                  _animationController.repeat();
                },
                child: Text("Rotate"),
              ),
              RaisedButton(
                onPressed: (){
                  _animationController.reset();
                },
                child: Text("Reset"),
              ),
            
            ],
          ),
        ],
      ),
    );
  }
}
