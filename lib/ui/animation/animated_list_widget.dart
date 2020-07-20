import 'dart:math';

import 'package:create/ui/util/util_ui.dart';
import 'package:flutter/material.dart';

class AnimatedListWidget extends StatefulWidget {
  const AnimatedListWidget({Key key}):super(key:key);
  @override
  _AnimatedListWidgetState createState() => _AnimatedListWidgetState();
}

class _AnimatedListWidgetState extends State<AnimatedListWidget> with SingleTickerProviderStateMixin{
  final _animatedListStatekey=GlobalKey<AnimatedListState>();
  final _random=Random();
  final _duration=const Duration(seconds: 1);
  List<Color> _listItem=<Color>[Colors.green,Colors.blue,Colors.red];

  Color getColor(){
    return Color.fromRGBO(_random.nextInt(256), _random.nextInt(256), _random.nextInt(256), 1);
  }


  void addItem(BuildContext context){
   int index=_listItem.isEmpty?0:_listItem.length;
   if(_animatedListStatekey.currentState!=null){
     _animatedListStatekey.currentState.insertItem(index,duration: _duration);
     _listItem.add(getColor());
   }else {
     _listItem.add(getColor());
     setState(() {

     });
   }
  }


  void removeItem(BuildContext context){
   if(_listItem.isNotEmpty&&_animatedListStatekey.currentState!=null){
     _animatedListStatekey.currentState.removeItem(0, (context, animation){
       return AnimationListItem(
           color:_listItem.isNotEmpty?_listItem[0]:Theme.of(context).accentColor,
           animation:animation,
           item:"${_listItem.length-1}");
     },
       duration:_duration,
     );

     _listItem.removeAt(0);
     ///If the list gets empty remove the remove button option
     ///from UI
     if(_listItem.isEmpty){
       setState(() {

       });
     }
   }
  }


  @override
  void dispose(){
    super.dispose();
    _animatedListStatekey.currentState?.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UtilUI.appBar(context, "AnimatedListState"),
      body:_listItem.isNotEmpty?AnimatedList(
        key: _animatedListStatekey,
        primary: true,
        padding: const EdgeInsets.all(16.0),
        initialItemCount:_listItem.length ,
        itemBuilder: (BuildContext context,int index,Animation animation){
          return AnimationListItem(
              gradientColor: getColor(),
              color: _listItem[index],
              animation: animation, item: "${_listItem[index]}  is present here with gradient");
        },
      ):Center(child: Text("Please add item"),),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: buttonsList(),
    );
  }

  Widget buttonsList(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        if(_listItem.isNotEmpty)
        IconButton(
          iconSize: 50.0,
          icon: Icon(Icons.remove_circle), onPressed:()=>removeItem(context),color: Theme.of(context).iconTheme.color,),

        IconButton(
          iconSize: 50.0,
          icon: Icon(Icons.add_circle), onPressed:()=>addItem(context),color: Theme.of(context).iconTheme.color,),

      ],
    );
  }

}





class AnimationListItem extends StatelessWidget {
  final Animation animation;
  final String item;
  final Color color;
  final gradientColor;
  AnimationListItem({Key key,this.gradientColor,@required this.animation,@required this.item,@required this.color}):assert(animation!=null),
      assert(item!=null),assert(color!=null),super(key:key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:8.0,bottom: 8.0),
      child: SizeTransition(
          sizeFactor: animation,
          child: Container(
            height: 80.0,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(top: 12.0,left: 12.0),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [color,gradientColor??Colors.blueAccent])
            ),
            child: Text(item),
          ),

      ),
    );
  }
}

