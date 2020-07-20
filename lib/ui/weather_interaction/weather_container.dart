import 'package:create/ui/weather_interaction/weather_status.dart';
import 'package:create/ui/weather_interaction/weather_status_animation.dart';
import 'package:flutter/material.dart';

class WeatherContainer extends StatelessWidget {
  const  WeatherContainer({Key key}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
            flex: 1,
            child: Container(
                height: MediaQuery.of(context).size.height/1.5,
                alignment: Alignment.center,
                child: WeatherStatusWidget(primaryIcon: Icon(Icons.wb_cloudy,size: 60,),temperature: "9",))),
        Expanded(
            flex: 1,
            child: WeatherStatusAnimation()),
      ],
    );
  }
}
