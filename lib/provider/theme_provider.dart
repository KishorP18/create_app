import 'package:create/shared_pref.dart';
import 'package:create/theme_const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier{
  ThemeProvider(){
    getAppTheme();
  }

  bool isDarkThemeEnabled=false;



   Future<void> setAppTheme() async{
     SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
     bool val=isDarkThemeEnabled^=true;
     sharedPreferences.setBool(SharedPref.isDarkThemeEnabled,val);
     getAppTheme();
   }

    Future<void> getAppTheme() async{
     SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
     isDarkThemeEnabled=sharedPreferences.getBool(SharedPref.isDarkThemeEnabled)??false;
     notifyListeners();
   }
}