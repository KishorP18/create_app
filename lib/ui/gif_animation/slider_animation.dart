import 'package:flutter/material.dart';

class SliderAnimation extends AnimatedWidget{
  const SliderAnimation({Key key,AnimationController animationController})
      :super(key:key, listenable:animationController);


  Animation<Offset> get _progress=>Tween(
    end:const  Offset(0.0,0.0),
    begin: const Offset(1.0, 0.0),
  ).animate(CurvedAnimation(
    parent: listenable,
    curve: Curves.fastOutSlowIn,

    //reverseCurve: Curves.easeIn,
  ));


  @override
  Widget build(BuildContext context) {
    return SlideTransition(
       position: _progress,
       child:ReelBoxRow(),

    );
  }
}

class ReelBoxRow extends StatelessWidget {
  const ReelBoxRow({Key key}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      children: <Widget>[
        ReelBox(),
        ReelBox(),
        ReelBox(),
        ReelBox(),
      ],
    );
  }
}



class ReelBox extends StatelessWidget {
  const ReelBox({Key key}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        color: Colors.brown.withOpacity(0.7),
        child: Column(
          children: <Widget>[
             RowBoxes(),
             SizedBox(height: 8.0,),
             Container(
               height: MediaQuery.of(context).size.height/6,
               width: 100,
               child: Card(
                 color: Colors.black26,
                 elevation: 6,
                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
               ),
             ),
            SizedBox(height: 8.0,),
            RowBoxes(),
          ],
        ),
      ),
    );
  }
}

class RowBoxes extends StatelessWidget {
  const RowBoxes({Key key}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Box(),
          Box(),
          Box(),
          Box(),
          Box(),
          Box(),
        ],
      ),
    );
  }
}


class Box extends StatelessWidget {
  const Box({Key key}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:8.0,bottom: 8.0),
      child: Container(
        height: 14.0,
        width: 14.0,
        decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.circular(2.0)
        ),
      ),
    );
  }
}


