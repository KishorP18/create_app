import 'package:flutter/material.dart';

class WeatherStatusWidget extends StatelessWidget {
  final Widget primaryIcon;
  final String temperature;

  const WeatherStatusWidget({Key key,@required this.primaryIcon,
  @required this.temperature}):assert(primaryIcon!=null),assert(temperature!=null),
  super(key:key);


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        primaryIcon,
        Text("${temperature} C",style: TextStyle(fontSize: 24.0),)
      ],
    );
  }
}
