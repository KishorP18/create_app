import 'package:flutter/material.dart';

class AnimatedSlider extends AnimatedWidget{
  const AnimatedSlider({Key key,AnimationController animationController})
      :super(key:key,listenable:animationController);


  Animation<double> get _progress=>listenable;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child:SliderTheme(
        data: SliderThemeData(
          trackHeight: 4.0,
          inactiveTrackColor: Colors.white,
          activeTrackColor: Colors.white,
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 14.0),
            thumbColor: Colors.brown.withOpacity(0.8),
        ),
        child: Slider(
            value: _progress.value,
            onChanged: (double val){
              return null;
            }),
      )
    );
  }
}
