import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Settings"),
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: ()=>Navigator.pop(context)),
      ),
      body: Center(
        child: Text("Settings"),
      ),
    );
  }
}
