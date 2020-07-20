import 'package:create/ui/util/util_ui.dart';
import 'package:flutter/material.dart';

class AnimatedModalBarrierWidget extends StatelessWidget {
 final Widget page;
 const AnimatedModalBarrierWidget({Key key,this.page}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UtilUI.appBar(context, "AnimatedModalBarrier"),
      body: Center(
        child: RaisedButton(
          onPressed: ()=>Navigator.push(context, MyPageRoute(page:page??_ModalPage(), dismissible: true)),
          child:Text("Show Modal Barrier"),),
      ),
    );
  }
}




class MyPageRoute extends TransitionRoute {
 final Widget  page;
 final bool dismissible;
  MyPageRoute({
    @required this.page,
    @required this.dismissible,
 }):assert(page!=null),assert(dismissible!=null);

  @override
  Animation<double> get animation => super.animation;

  @override
  bool get opaque => false;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 1000);

  @override
  Iterable<OverlayEntry> createOverlayEntries() {
    return [
      OverlayEntry(builder:_buildRoute),
      OverlayEntry(builder:(context)=>page),
    ];
  }

  Widget _buildRoute(BuildContext context){
    return IgnorePointer(
       ignoring: animation.status==AnimationStatus.reverse||animation==AnimationStatus.completed,
       child: AnimatedModalBarrier(
         dismissible: dismissible,
         color: animation.drive(
           ColorTween(
             begin: Colors.transparent,
             end: Theme.of(context).focusColor.withAlpha(90)
           ),
         ),
       ),
    );
  }
}


class _ModalPage extends StatelessWidget {
  const _ModalPage({Key key}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Container(
          width: MediaQuery.of(context).size.width/2,
          height: MediaQuery.of(context).size.height/3,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              const Text("Animated"),
              const Text("Modal  View"),
              const SizedBox(
                height: 16.0,
              ),

              RaisedButton(
                  child:const Text("Close view"),
                  onPressed: ()=>Navigator.pop(context))
            ],
          ),
        ),
      ),
    );
  }
}
