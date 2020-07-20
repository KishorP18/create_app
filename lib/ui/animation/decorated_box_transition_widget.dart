import 'package:create/ui/util/util_ui.dart';
import 'package:flutter/material.dart';

class DecoratedBoxTransitionwidget extends StatefulWidget {
  const DecoratedBoxTransitionwidget({Key key}):super(key:key);
  @override
  _DecoratedBoxTransitionwidgetState createState() => _DecoratedBoxTransitionwidgetState();
}

class _DecoratedBoxTransitionwidgetState extends State<DecoratedBoxTransitionwidget>
    with SingleTickerProviderStateMixin{
  AnimationController _animationController;
  bool _isAnimationEnabled=false;
  final DecorationTween _decorationTween=DecorationTween(
    begin: BoxDecoration(
      color: const Color(0xFFFFFFFF),
      border: Border.all(
        color: const Color(0xFF000000),
        width: 4.0,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.zero,
      shape: BoxShape.rectangle,
      boxShadow: const <BoxShadow>[
        BoxShadow(
          color: Color(0x66000000),
          blurRadius: 10.0,
          spreadRadius: 4.0,
        ),
      ],
    ),

    end: BoxDecoration(
        color: const Color(0xFF000000),
        border: Border.all(
        color:const Color(0xFF202020),
         width: 1.0,
         style: BorderStyle.solid,
        ),
      borderRadius: BorderRadius.circular(10.0),
      shape: BoxShape.rectangle
    )
  );

  @override
  void initState(){
    super.initState();
    _animationController=AnimationController(
        duration: const Duration(milliseconds: 1500),
        vsync:this);

  }


  @override
  void dispose(){
    super.dispose();
    _animationController?.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UtilUI.appBar(context, "DecoratedBoxTransition"),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        primary: true,
        children: <Widget>[
          DecoratedBoxTransition(
            position: DecorationPosition.background,
            child: Container(
              height:MediaQuery.of(context).size.height/2,
              //width: 200,
              child: FlutterLogo(

              ),
            ),
            decoration: _decorationTween.animate(_animationController),
          ),
          SizedBox(height: 20.0,),
          RaisedButton(
              child: Text("Click Me!"),
              onPressed: (){
                setState(() {
                  _isAnimationEnabled^=true;
                  if(_isAnimationEnabled){
                    _animationController.forward();
                  }else{
                    _animationController.reverse();
                  }
                });
              })
        ],
      ),
    );
  }
}
