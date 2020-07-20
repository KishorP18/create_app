import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {
  final  Widget leadingIcon;
  final String title;
  final String subTitle;

  const IconWidget({Key key,@required this.leadingIcon,@required this.title,
    this.subTitle=""}):assert(leadingIcon!=null),assert(title!=null),super(key:key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        leadingIcon,
        SizedBox(width: 8.0,),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(title),
            Text(subTitle,softWrap: true,),
          ],
        ),
      ],
    );
  }
}
