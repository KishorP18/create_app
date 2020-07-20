import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardUI extends StatelessWidget {
  final DismissDirectionCallback onDismissed;
  final Color cardColor;

  const CardUI({Key key,this.onDismissed,
    @required this.cardColor}):
        assert(cardColor!=null),super(key:key);
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Dismissible(
        key: UniqueKey(),
        background: Container(
          height: MediaQuery.of(context).size.height/4.5,
          width: MediaQuery.of(context).size.width,
          child: Center(child: Text("Removed"),),
          color: cardColor.withOpacity(0.1),
        ),
        onDismissed: onDismissed,
        direction: DismissDirection.startToEnd,
        movementDuration: const Duration(milliseconds: 3000),
        child: Container(
          height: MediaQuery.of(context).size.height/4.5,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors:[cardColor.withOpacity(0.4),cardColor]
            ),
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
               color:Colors.grey,
               offset: Offset(1.0, 2.0),
               blurRadius: 2.0
              )
            ]
          ),
          padding: const EdgeInsets.all(16.0),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SvgPicture.asset("assets/icons/american-express.svg",height: 30,width: 30,),
              Center(child: Text("42221 7058 5555 9898",style: TextStyle(fontSize: 16.0),)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Kishore Purohit",style: TextStyle(fontSize: 14.0),),
                  Text("07/21",style: TextStyle(fontSize: 16.0),),
                  SvgPicture.asset("assets/icons/visa.svg",height: 30,width: 30,),
                ],
              ),


            ],
          ),
        ),
      ),
    );
  }
}
