import 'package:create/routes.dart';
import 'package:flutter/material.dart';

class AnimationList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation Widgets"),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        primary: true,
        children: <Widget>[
          CardTile(title: "Hero",
              icon: Icon(Icons.exposure),
              subTitle: "A widget that marks its child as being a candidate for hero animations.",
              onTap: ()=>Navigator.pushNamed(context, Routes.heroExample)),

          CardTile(
              title: "Animation Builder",
              icon: Icon(Icons.exposure),
              subTitle: "An example of animated builder",
              onTap: () =>
                  Navigator.pushNamed(context, Routes.animationBuilderWidget)),
          CardTile(
              title: "Animated Container",
              icon: Icon(Icons.exposure),
              subTitle:
                  "Container animated by using inbuilt properties of AnimatedContainer",
              onTap: () => Navigator.pushNamed(
                  context, Routes.animationContainerWidget)),
          CardTile(
              title: "AnimatedCrossFade",
              icon: Icon(Icons.exposure),
              subTitle: "This example fades between two representations",
              onTap: () =>
                  Navigator.pushNamed(context, Routes.animatedCrossFade)),
          CardTile(
              title: "AnimatedDefaultTextStyle",
              icon: Icon(Icons.exposure),
              subTitle:
                  "Animated version of DefaultTextStyle which automatically transitions the default text style "
                  "over a given duration whenever the given style changes.",
              onTap: () => Navigator.pushNamed(
                  context, Routes.animatedDefaultTextWidget)),
          CardTile(
              title: "AnimatedList",
              icon: Icon(Icons.exposure),
              subTitle: "The state for a scrolling container that animates items when they are inserted or removed.",
              onTap: () =>
                  Navigator.pushNamed(context, Routes.animatedListWidget)),
          CardTile(title: "AnimatedModalBarrier", icon: Icon(Icons.exposure),
              subTitle: "A widget that prevents the user from interacting with "
                  "widgets behind itself, and can be configured with an animated color value.",
              onTap: ()=>Navigator.pushNamed(context, Routes.animatedModalBarrier)),
          CardTile(title: "AnimatedOpacity", icon: Icon(Icons.exposure),
              subTitle: "Animated version of Opacity which automatically transitions the "
                  "child's opacity over a given duration whenever the given opacity changes.",
              onTap:()=> Navigator.pushNamed(context, Routes.animatedOpacityWidget)),
          CardTile(title: "AnimatedPhysicalModel",
              icon: Icon(Icons.exposure),
              subTitle: "Animated version of PhysicalModel.",
              onTap: ()=>Navigator.pushNamed(context, Routes.animatedPhysicalModel)),
          CardTile(title: "AnimatedPositioned", icon: Icon(Icons.exposure),
              subTitle: "Animated version of Positioned which automatically transitions"
                  " the child's position over a given duration whenever the given position changes.",
              onTap: ()=>Navigator.pushNamed(context, Routes.animatedPositionedWidget)),

          CardTile(
              title: "AnimatedWidget",
              subTitle: "A widget that rebuilds when the given Listenable changes value.",
              icon: Icon(Icons.exposure),
              onTap: ()=>Navigator.pushNamed(context, Routes.animatedWidgetExample)),
          CardTile(
              title: "DecoratedBoxTransition",
              subTitle: "Animated version of a DecoratedBox that animates the different properties of its Decoration.",
              icon: Icon(Icons.exposure),
              onTap: ()=>Navigator.pushNamed(context, Routes.decoratedBoxTransitionWidget)),

          CardTile(
              title: "PositionedTransition",
              subTitle: "Animated version of Positioned which takes a specific Animation<RelativeRect> to "
                  "transition the child's position from a start position to an end position over the lifetime of the animation.",
              icon: Icon(Icons.exposure),
              onTap: ()=>Navigator.pushNamed(context, Routes.positionTransitionWidget)),

          CardTile(
              title: "RotationTransition",
              subTitle: "Animates the rotation of a widget.",
              icon: Icon(Icons.exposure),
              onTap: ()=>Navigator.pushNamed(context, Routes.rotationTransition)),
          CardTile(
              title: "SlideTransition",
              subTitle: "Animates the position of a widget relative to its normal position.",
              icon: Icon(Icons.exposure),
              onTap: ()=>Navigator.pushNamed(context, Routes.slideTransition)),
        ],
      ),
    );
  }
}

class CardTile extends StatelessWidget {
  final String title;
  final Function onTap;
  final dynamic icon;
  final String subTitle;
  CardTile(
      {@required this.title,
      @required this.icon,
      @required this.onTap,
      this.subTitle = ""})
      : assert(title != null),
        assert(icon != null),
        assert(onTap != null);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
        ),
        child: Card(
          child: ListTile(
            contentPadding: const EdgeInsets.only(left: 12.0,bottom:12.0,right: 12.0),
            leading: icon,
            title:Text(title),
            subtitle: Padding(
              padding: const EdgeInsets.only(top:4.0,bottom:8.0),
              child: Text(
                subTitle,
                style: TextStyle(fontSize: 12.0),
              ),
            ),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
        ),
      ),
    );
  }
}
