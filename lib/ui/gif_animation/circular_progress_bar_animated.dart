import 'package:create/ui/util/util_methods.dart';
import 'package:flutter/material.dart';

class CircularProgressBarAnimated  extends AnimatedWidget{

  const CircularProgressBarAnimated({Key key,AnimationController animationController})
      :super(key:key, listenable:animationController);


  Animation<double> get _progress=>listenable;




  @override
  Widget build(BuildContext context) {


     return Padding(
       padding: const EdgeInsets.all(16.0),
       child: Stack(
         alignment: Alignment.center,
         children: <Widget>[
           Container(
             width: 60,
             height: 60,
             child: CircularProgressIndicator(
                value: _progress.value,
                strokeWidth: 4.0,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
           ),
            Text(UtilMethod.countDown(_progress.value,),style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.brown),)
          ],
       ),
     );
  }


}

