import 'package:create/ui/util/util_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
class HeroExample extends StatefulWidget {
  @override
  _HeroExampleState createState() => _HeroExampleState();
}

class _HeroExampleState extends State<HeroExample> {
  @override
  void initState(){
    super.initState();
    timeDilation=5;
  }

  @override
  void dispose(){
    super.dispose();
    timeDilation=1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UtilUI.appBar(context, "Hero class"),
      body: ListView(
        primary: true,
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          Hero(
            tag: "owl",
            child: Image.asset("assets/icons/owl.jpg",height: 150,width: 150,),

            flightShuttleBuilder: (flightContext,animation,direction,fromContext,toContext){
              return Image.asset("assets/icons/owl.jpg",height: 150,width: 150,);
            },

          ),
          SizedBox(height: 16.0,),
          Center(
            child: RaisedButton(
                child: Text("Show Hero transition"),
                onPressed: ()=>Navigator.push(context, MaterialPageRoute<void>(builder: (context)=>HeroPage2(tag:"owl",child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    height: 300.0,
                    width: MediaQuery.of(context).size.width,
                    child: Hero(
                      tag: "owl",
                      child: Image.asset("assets/icons/owl.jpg",fit: BoxFit.contain,),
                    ),
                  ),
                ),))
                )),
          )
        ],
      ),
    );
  }
}


class HeroPage2 extends StatelessWidget {
  final String tag;
  final Widget child;
  const HeroPage2({Key key,@required this.tag,@required this.child}):
        assert(tag!=null),assert(child!=null),
        super(key:key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UtilUI.appBar(context, ""),
      body: child,
    );
  }
}




