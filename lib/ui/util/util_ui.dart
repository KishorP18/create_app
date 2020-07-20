import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UtilUI{
  static AppBar appBar(BuildContext context,String title){
    return AppBar(
      leading: IconButton(icon: Icon(Icons.arrow_back,), onPressed: ()=>Navigator.pop(context)),
      title: Text(title),

    );
  }
}