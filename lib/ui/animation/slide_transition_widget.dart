import 'package:create/ui/util/util_ui.dart';
import 'package:flutter/material.dart';


class SlideTransitionWidget extends StatefulWidget {
  const SlideTransitionWidget({Key key}):super(key:key);
  @override
  _SlideTransitionWidgetState createState() => _SlideTransitionWidgetState();
}

class _SlideTransitionWidgetState extends State<SlideTransitionWidget> with
  SingleTickerProviderStateMixin{
  AnimationController _animationController;
  Animation _animation;

  @override
  void initState(){
    super.initState();
    _animationController=AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500)
    )..repeat(reverse: true);

    _animation=Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(1.5, 0.0)
    ).animate(_animationController);
  }


  @override
  void dispose(){
    _animationController?.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UtilUI.appBar(context, "SlideTransition"),
      body: ListView(
        children: <Widget>[
          SlideTransition(
            position: _animation,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: FlutterLogo(
                size: 150.0,
              ),
            ),
          ),
          Divider(),
          SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0.0, 1.0),
              end: Offset.zero,
            ).animate(_animationController),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: FlutterLogo(
                size: 150.0,
              ),
            ),
          ),

        ],
      ),
    );
  }
}
