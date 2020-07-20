import 'package:flutter/material.dart';

class GIFSizeTransition extends StatelessWidget {
  final AnimationController animationController;
  const GIFSizeTransition({Key key,@required this.animationController}):
      assert(animationController!=null),super(key:key);
  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      axis: Axis.vertical,
      sizeFactor: animationController,
      child:Container(
        height: 100,
        color: Colors.brown.withOpacity(0.7),
      ) ,
    );
  }
}
