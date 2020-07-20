import 'package:flutter/material.dart';

class ContactScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Contact"),
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: ()=>Navigator.pop(context)),
      ),
      body: Center(
        child: Text("Contact"),
      ),
    );
  }
}
