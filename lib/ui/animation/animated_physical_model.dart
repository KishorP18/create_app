import 'package:create/ui/util/util_ui.dart';
import 'package:flutter/material.dart';

class AnimatedPhysicalModelWidget extends StatefulWidget {
  const AnimatedPhysicalModelWidget({Key key}):super(key:key);

  @override
  _AnimatedPhysicalModelWidgetState createState() => _AnimatedPhysicalModelWidgetState();
}

class _AnimatedPhysicalModelWidgetState extends State<AnimatedPhysicalModelWidget> {
  bool _isAnimationEnabled=true;
  void _animate(){
    setState(() {
      _isAnimationEnabled^=true;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UtilUI.appBar(context, "AnimatedPhysicalModel"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedPhysicalModel(
                animateColor: true,
                child: FlutterLogo(
                  size: 200.0,
                ),
                shape: BoxShape.rectangle,
                curve: Curves.ease,
                elevation: 1.0,
                color: Colors.yellow.withAlpha(80),
                animateShadowColor: true,
                borderRadius: _isAnimationEnabled?BorderRadius.circular(30.0):BorderRadius.circular(0.0),
                shadowColor:_isAnimationEnabled?Colors.white:Colors.black,
                duration: const Duration(milliseconds: 1500)),


            SizedBox(
              height: 20.0,
            ),
            
            RaisedButton(
                child: Text("Click Here to Animate!"),
                onPressed: _animate)
          ],
        ),
        
      ),
    );
  }
}
