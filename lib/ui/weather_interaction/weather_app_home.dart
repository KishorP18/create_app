import 'package:create/ui/weather_interaction/weather_app_drawer.dart';
import 'package:create/ui/weather_interaction/weather_app_title.dart';
import 'package:create/ui/weather_interaction/weather_container.dart';
import 'package:flutter/material.dart';

class WeatherAppHome extends StatelessWidget {
  final _scaffoldKey=GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: Drawer(
        child: WeatherAppDrawer(),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Colors.blue.withOpacity(0.1),
                Colors.blueAccent
              ]),
        ),
        child:ListView(
          primary: true,
          children: <Widget>[
            WeatherAppTitle(title:"Mumbai",dateTime: DateTime.now(),scaffoldKey: _scaffoldKey,),
            WeatherContainer(),
            //WeatherIconAnimation(),
          ],
        ),
      ),
    );
  }
}
