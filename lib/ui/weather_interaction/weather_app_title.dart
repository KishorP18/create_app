import 'package:create/ui/util/util_methods.dart';
import 'package:flutter/material.dart';

class WeatherAppTitle extends StatelessWidget {
  final String title;
  final DateTime dateTime;
  final GlobalKey<ScaffoldState> scaffoldKey;

  const WeatherAppTitle({Key key,@required this.scaffoldKey,@required this.title,@required this.dateTime}):
      assert(title!=null),assert(scaffoldKey!=null),assert(dateTime!=null),super(key:key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.only(left: 30.0,top: 18.0,right: 12.0) ,
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
           mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(UtilMethod.formatDate(dateTime),style: TextStyle(fontSize: 15.0),),
              Padding(
                padding: const EdgeInsets.only(top:8.0,bottom: 8.0),
                child: Text(title,style: TextStyle(fontSize: 24.0),),
              ),
            ],
          ),

          IconButton(
            onPressed: (){
             scaffoldKey.currentState.openEndDrawer();
            },
            icon: Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
    );
  }
}
