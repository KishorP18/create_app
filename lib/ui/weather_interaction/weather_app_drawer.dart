import 'package:flutter/material.dart';

import 'icon_widget.dart';

class WeatherAppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Colors.blue.withOpacity(0.1),
                Colors.blueAccent
              ]),
        ),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            ListTile(
              leading: SizedBox(width: 8.0,),
              title: IconWidget(leadingIcon: Icon(Icons.cloud),title: "1",subTitle: "Sunny",),
            ),
            SizedBox(height: 10.0,),
            ListTile(
              leading: SizedBox(width: 8.0,),
              title: IconWidget(leadingIcon: Icon(Icons.cloud),title: "1",subTitle: "Sunny",),
            ),
            SizedBox(height: 10.0,),
            ListTile(
              leading: SizedBox(width: 8.0,),
              title: IconWidget(leadingIcon: Icon(Icons.cloud),title: "1",subTitle: "Sunny",),
            ),
            SizedBox(height: 10.0,),
            ListTile(
              leading: SizedBox(width: 8.0,),
              title: IconWidget(leadingIcon: Icon(Icons.cloud),title: "1",subTitle: "Sunny",),
            ),
            SizedBox(height: 10.0,),

        ],),
      ),
    );
  }
}
