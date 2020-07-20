
import 'package:create/ui/credit_card_interaction/card_ui.dart';
import 'package:create/ui/util/util_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardInteractionHome extends StatefulWidget {
  @override
  _CardInteractionHomeState createState() => _CardInteractionHomeState();
}

class _CardInteractionHomeState extends State<CardInteractionHome> with SingleTickerProviderStateMixin{
  List<Color> _colors=<Color>[Colors.yellowAccent,Colors.redAccent,Colors.blueAccent,
        Colors.amberAccent,Colors.brown,Colors.orangeAccent,Colors.deepOrangeAccent];
  Color _selectedColor;
  bool _accepted=false;



  @override
  void initState(){
    super.initState();

  }


  @override
  void dispose(){
    super.dispose();
  }


  void onCardDismissed(int index){
    setState(() {
      _colors.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UtilUI.appBar(context, "Credit Card Interaction"),
      body: ListView(
        primary: true,
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          DragTarget<int>(
            builder: (context, List<int> candidateData, rejectedData){
              print(candidateData);
            if(_accepted){
              return CardUI(
                  cardColor:_selectedColor);
            }else{
              return CardUI(cardColor: _colors.isEmpty?_colors[0]:Colors.redAccent,);
            }
          },
          onAccept: (int data){
              setState(() {
                _accepted=true;//Set accepted to true
              });

          },
          onLeave: (data){
              print("left");

          },
          onWillAccept: (data){
              return true;
              },
          ),
          SizedBox(
            height: 50.0,
          ),
          Text("Select Card Theme"),
          SizedBox(
            height: 12.0,
          ),
          Builder(
            builder: (context){
              return Stack(
                alignment: Alignment.center,
                children:List.generate(_colors.length, (index) =>
                    Transform.translate(
                        offset: Offset(0.0, (_colors.length-index)*30.0) ,
                        child: Draggable<int>(
                          axis: Axis.vertical,
                          feedback: CardUI(
                            onDismissed:(DismissDirection _dismissDirection){
                             onCardDismissed(index);
                            },
                            cardColor: _colors[index],),
                          child: CardUI(
                            onDismissed:(DismissDirection _dismissDirection){
                            onCardDismissed(index);
                          },
                            cardColor: _colors[index],),
                          data: index,
                          onDragCompleted: (){
                            _selectedColor= _colors.removeAt(index);
                          },
                        )
                    )

                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
