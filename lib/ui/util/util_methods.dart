import 'package:intl/intl.dart';

class UtilMethod{
  static  String formatDate(DateTime _dateTime){
    return DateFormat("E,MMM d", 'en_US').format(_dateTime);
  }

  static String getPercent(double value){
    return "${(value*100).toInt()} %";
  }

  static String countDown(double value){
     double val=10.0-(value*10);

     return val==0.0?"\u25b6":"${val.toInt()}";
  }
}