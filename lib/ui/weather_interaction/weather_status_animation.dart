import 'package:create/ui/weather_interaction/icon_widget.dart';
import 'package:flutter/material.dart';

class WeatherStatusAnimation extends StatefulWidget {
  const WeatherStatusAnimation({Key key}):super(key:key);
  @override
  _WeatherStatusAnimationState createState() => _WeatherStatusAnimationState();
}

class _WeatherStatusAnimationState extends State<WeatherStatusAnimation>{
 bool _animated=false;
  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
  Future.delayed(Duration(milliseconds: 100),(){
    setState(() {
      _animated=true;
    });
  });
  }

  @override
  Widget build(BuildContext context) {
    final _width=MediaQuery.of(context).size.width;
    final _height=MediaQuery.of(context).size.height;
    return Container(
      height: _height,
      child: Stack(
        children: <Widget>[
          AnimatedPositioned(
            top: _animated?_height/1.5:0.0,
            curve: Curves.easeInCirc,
            duration: const Duration(milliseconds: 2000),
            child: IconWidget(leadingIcon: Icon(Icons.cloud),title: "9:00",subTitle: "Sunny",),
          ),
          AnimatedPositioned(
            top: _animated?_height/2.2:0.0,
            left:_animated?_width/6:0.0,
            curve: Curves.easeInCirc,
            duration: const Duration(milliseconds: 1700),
            child: IconWidget(leadingIcon: Icon(Icons.wb_sunny),title: "7:00",subTitle: "Sunny",),
          ),
          AnimatedPositioned(
            top: _animated?_height/3.5:0.0,
            left: _animated?_width/5:0.0,
            curve: Curves.easeInCirc,
            duration: const Duration(milliseconds: 1400),
            child: IconWidget(leadingIcon: Icon(Icons.wb_cloudy),title: "4:30",subTitle: "Sunny",),
          ),
          AnimatedPositioned(
            top: _animated?_height/10:0.0,
            left: _animated?20:0.0,
            curve: Curves.easeInCirc,
            duration: const Duration(milliseconds: 1100),
            child: IconWidget(leadingIcon: Icon(Icons.wb_sunny),title: "1:30",subTitle: "Sunny",),
          ),

        ],
      ),
    );
  }
}


//class FlowStatusDelegate extends FlowDelegate{
//  Animation animation;
//  double width;
//  FlowStatusDelegate({@required this.animation,this.width=0}):assert(animation!=null),super(repaint:animation);
//
//  @override
//  void paintChildren(FlowPaintingContext context) {
//   double dy=0.0;
//   for(int i=0;i<context.childCount;i++){
//     dy=context.getChildSize(i).height*i;
//     context.paintChild(i,
//     transform: Matrix4.translationValues(width, dy*animation.value, 0)
//     );
//   }
//  }
//
//
//  @override
//  bool shouldRepaint(FlowStatusDelegate flowStatusDelegate) {
//    return animation!=flowStatusDelegate.animation;
//  }
//}

