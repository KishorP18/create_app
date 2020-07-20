import 'dart:math';

import 'package:create/ui/util/util_ui.dart';
import 'package:flutter/material.dart';

class AnimatedDefaultTextStyleWidget extends StatefulWidget {
  const AnimatedDefaultTextStyleWidget({Key key}):super(key:key);
  @override
  _AnimatedDefaultTextStyleWidgetState createState() => _AnimatedDefaultTextStyleWidgetState();
}

class _AnimatedDefaultTextStyleWidgetState extends State<AnimatedDefaultTextStyleWidget> {

  double _fontSize=50.0;
  Color _color=Colors.green;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UtilUI.appBar(context, "AnimatedDefaultTextStyle"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          primary: true,
          children: <Widget>[
            Center(
              child: AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 1000),
                curve: Curves.bounceIn,
                style: TextStyle(
                  fontSize: _fontSize,
                  color: _color,
                  fontWeight: FontWeight.bold,
                ),
                child: Text("Flutter Widgets"),
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            Center(
              child: RaisedButton(
                  child: Text("Click Me!"),
                  onPressed:(){
                final random=Random();
                setState(() {
                  _fontSize=random.nextInt(100).toDouble();
                  _color=Color.fromARGB(255,random.nextInt(256) , random.nextInt(256), random.nextInt(256));
                });
              }),
            )
          ],
        ),
      ),
    );
  }
}
