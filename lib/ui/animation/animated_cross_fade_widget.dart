import 'package:create/ui/util/util_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AnimatedCrossFadeWidget extends StatefulWidget {
  const AnimatedCrossFadeWidget({Key key}):super(key:key);
  @override
  _AnimatedCrossFadeWidgetState createState() => _AnimatedCrossFadeWidgetState();
}

class _AnimatedCrossFadeWidgetState extends State<AnimatedCrossFadeWidget> {
  bool _isFirst=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UtilUI.appBar(context,"AnimatedCrossFade"),
      body: Center(
        child: AnimatedCrossFade(

            firstChild: Welcome(),
            secondChild: ThankYou(),
            crossFadeState: _isFirst?CrossFadeState.showFirst:CrossFadeState.showSecond,
            duration: const Duration(milliseconds: 1500),

        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            _isFirst^=true;
          });
        },
        child: Icon(Icons.track_changes),
      ),
    );
  }
}


class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SvgPicture.asset("assets/icons/welcome.svg",
        height:MediaQuery.of(context).size.height/1.5,
        width: MediaQuery.of(context).size.width,color: Theme.of(context).iconTheme.color,),
        SizedBox(height: 10.0,),
        Text("Welcome!!",style: TextStyle(fontSize: 20.0),),
      ],
    );
  }
}


class ThankYou extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        SvgPicture.asset("assets/icons/thankyou.svg",
          height:MediaQuery.of(context).size.height/1.5,
          width: MediaQuery.of(context).size.width,
          color: Theme.of(context).iconTheme.color,),
        SizedBox(height: 10.0,),
        Text("Thank You!!",style: TextStyle(fontSize: 20.0),),
      ],
    );
  }
}





