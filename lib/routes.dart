import 'package:create/ui/animation/animated_cross_fade_widget.dart';
import 'package:create/ui/animation/animated_default_text_style_widget.dart';
import 'package:create/ui/animation/animated_list_widget.dart';
import 'package:create/ui/animation/animated_opacity_widget.dart';
import 'package:create/ui/animation/animated_physical_model.dart';
import 'package:create/ui/animation/animated_positioned_widget.dart';
import 'package:create/ui/animation/animated_widget_example.dart';
import 'package:create/ui/animation/animation_container_widget.dart';
import 'package:create/ui/animation/decorated_box_transition_widget.dart';
import 'package:create/ui/animation/position_transition_widget.dart';
import 'package:create/ui/animation/rotation_transition_widget.dart';
import 'package:create/ui/animation/slide_transition_widget.dart';
import 'package:create/ui/credit_card_interaction/card_interaction_home.dart';
import 'package:create/ui/drawer_screens/contact_screen.dart';
import 'package:create/ui/drawer_screens/settings_screen.dart';
import 'package:create/ui/gif_animation/gif_animation.dart';
import 'package:create/ui/weather_interaction/weather_app_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home.dart';
import 'ui/animation/animated_modal_barrier_widget.dart';
import 'ui/animation/animation_builder_widget.dart';
import 'ui/animation/animation_list.dart';
import 'ui/animation/hero_example.dart';

class Routes{
  static const home="/";
  static const settingsScreen="/settings_screen";
  static const contactScreen="/contact_screen";
  static const animationListScreen="/animation_list";
  static const animationBuilderWidget="/animation_builder_widget";
  static const animationContainerWidget="/animation_container_widget";
  static const animatedCrossFade="/animated_cross_fade_widget";
  static const animatedDefaultTextWidget="/animated_default_text_widget";
  static const animatedListWidget="/animated_list_widget";
  static const animatedModalBarrier="/animated_modal_barrier";
  static const animatedOpacityWidget="/animated_opacity_widget";
  static const animatedPhysicalModel="/animated_physical_model";
  static const animatedPositionedWidget="/animated_positioned_widget";
  static const animatedWidgetExample="/animated_widget_example";
  static const decoratedBoxTransitionWidget="/decorated_box_transition_widget";
  static const heroExample="/hero_example";
  static const positionTransitionWidget="/position_transition_widget";
  static const rotationTransition="/rotation_transition";
  static const slideTransition="/slide_transition";
  static const weather_app_home="/weather_app_home";
  static const gifAnimation="/gif_animation";
  static const creditCardAnimation="/credit_card_animation";
  static Route<dynamic> generateRoute(RouteSettings routeSettings){
    switch(routeSettings.name){
      case home:
        return MaterialPageRoute(builder: (context)=>Home());
      case settingsScreen:
        return MaterialPageRoute(builder: (context)=>SettingsScreen());
      case contactScreen:
        return MaterialPageRoute(builder: (context)=>ContactScreen());
      case animationListScreen:
        return MaterialPageRoute(builder: (context)=>AnimationList());
      case animationBuilderWidget:
        return MaterialPageRoute(builder: (context)=>AnimationBuilderWidget());
      case animationContainerWidget:
        return MaterialPageRoute(builder: (context)=>AnimationContainerWidget());
      case animatedCrossFade:
        return MaterialPageRoute(builder: (context)=>AnimatedCrossFadeWidget());
      case animatedDefaultTextWidget:
        return MaterialPageRoute(builder: (context)=>AnimatedDefaultTextStyleWidget());
      case animatedListWidget:
        return MaterialPageRoute(builder: (context)=>AnimatedListWidget());
      case animatedModalBarrier:
        return MaterialPageRoute(builder: (context)=>AnimatedModalBarrierWidget());
      case animatedOpacityWidget:
        return MaterialPageRoute(builder: (context)=>AnimatedOpacityWidget());
      case animatedPhysicalModel:
        return MaterialPageRoute(builder: (context)=>AnimatedPhysicalModelWidget());
      case animatedPositionedWidget:
        return MaterialPageRoute(builder: (context)=>AnimatedPositionedWidget());
      case animatedWidgetExample:
        return MaterialPageRoute(builder: (context)=>AnimatedWidgetExample());
      case decoratedBoxTransitionWidget:
        return MaterialPageRoute(builder: (context)=>DecoratedBoxTransitionwidget());
      case heroExample:
        return MaterialPageRoute(builder: (context)=>HeroExample());
      case positionTransitionWidget:
        return MaterialPageRoute(builder: (context)=>PositionTransitionWidget());
      case rotationTransition:
        return MaterialPageRoute(builder: (context)=>RotationTransitionWidget());
      case slideTransition:
        return MaterialPageRoute(builder: (context)=>SlideTransitionWidget());
      case weather_app_home:
        return MaterialPageRoute(builder: (context)=>WeatherAppHome());
      case gifAnimation:
        return MaterialPageRoute(builder: (context)=>GifAnimation());
      case creditCardAnimation:
        return MaterialPageRoute(builder: (context)=>CardInteractionHome());
    }
  }
}