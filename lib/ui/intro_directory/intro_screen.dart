import 'package:create/provider/theme_provider.dart';
import 'package:create/routes.dart';
import 'package:fancy_drawer/fancy_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'card_grid.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key key}):super(key:key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen>  with SingleTickerProviderStateMixin{
  FancyDrawerController _fancyDrawerController;

  @override
  void initState(){
    super.initState();
    _fancyDrawerController=FancyDrawerController(vsync: this,duration: Duration(milliseconds: 250))..addListener(() {
      setState(() {

      });
    });
  }


  @override
  void dispose(){
    super.dispose();
    _fancyDrawerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: FancyDrawerWrapper(
        controller: _fancyDrawerController,
        backgroundColor: Theme.of(context).focusColor,
        drawerItems: <Widget>[
          InkWell(
            onTap: ()=>Navigator.pushNamed(context, Routes.settingsScreen),
            child: ListTile(
              leading: Icon(Icons.settings),
              title:   Text(
                "Settings",
                style: TextStyle(
                  fontSize: 18,
                  // color: Colors.purple.shade700,
                 // fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          InkWell(
            onTap: ()=>Navigator.pushNamed(context, Routes.contactScreen),
            child: ListTile(
              leading: Icon(Icons.person),
              title: Text(
                "Contact",
                style: TextStyle(
                  fontSize: 18,
                  // color: Colors.purple.shade700,
                 // fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
        child: Scaffold(
          appBar: AppBar(
            title: Text("Create"),
            centerTitle: true,
            actions: <Widget>[
              IconButton(icon:Icon(Icons.offline_bolt), onPressed:()=>Provider.of<ThemeProvider>(context,listen:false).setAppTheme())
            ],
            leading: IconButton(icon: Icon(Icons.menu), onPressed:(){
              _fancyDrawerController.toggle();
            }),
          ),

          body:CardGrid(),
        ),
      ),
    );
  }
}



