import 'package:create/ui/util/util_ui.dart';
import 'package:flutter/material.dart';

class AnimatedOpacityWidget extends StatefulWidget {
  const AnimatedOpacityWidget({Key key}):super(key:key);
  @override
  _AnimatedOpacityWidgetState createState() => _AnimatedOpacityWidgetState();
}

class _AnimatedOpacityWidgetState extends State<AnimatedOpacityWidget> {
  double opacity=1.0;
  void onTap(double val){
    setState(() {
      opacity=val;
     // isOpacityEnabled^=true;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UtilUI.appBar(context, "AnimatedOpacity"),
      body: Center(
        child: Column(
          children: <Widget>[
            AnimatedOpacity(
                opacity: opacity,
                curve: Curves.easeOut,
                duration: const Duration(milliseconds: 1200),
                child: Container(
                    height: MediaQuery.of(context).size.height/2.0,
                    width: MediaQuery.of(context).size.width/1.5,
                    child: Image.asset("assets/icons/flutter_dart.png",fit: BoxFit.contain,))

            ),

            Text("Click To Change Opacity"),
            SizedBox(height: 12.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                    child: Text("0.0"),
                    onPressed: ()=>onTap(0.0)),
                RaisedButton(
                    child: Text("0.2"),
                    onPressed: ()=>onTap(0.2)),
                RaisedButton(
                    child: Text("0.4"),
                    onPressed: ()=>onTap(0.4)),

              ],
            ),
           SizedBox(
             height: 12.0,
           ),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: <Widget>[
               RaisedButton(
                   child: Text("0.6"),
                   onPressed: ()=>onTap(0.6)),
               RaisedButton(
                   child: Text("0.8"),
                   onPressed: ()=>onTap(0.8)),
               RaisedButton(
                   child: Text("1.0"),
                   onPressed: ()=>onTap(1.0)),
             ],
           ),


          ],
        ),
      ),
    );
  }
}
