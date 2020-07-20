import 'package:create/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class CardGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
        primary: true,
        padding: const EdgeInsets.all(20.0),
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        crossAxisCount: 2,
       children: <Widget>[
         CardElement(onTap: ()=>Navigator.pushNamed(context, Routes.creditCardAnimation),
             title: "Card Interaction", icon: Icon(Icons.credit_card)),
         CardElement(onTap: ()=>Navigator.pushNamed(context, Routes.gifAnimation),
             title: "Weather Interaction", icon: Icon(Icons.forward)),
         CardElement(onTap: ()=>print("hello"), title: "IOS", icon:SvgPicture.asset("assets/icons/apple.svg",
           fit: BoxFit.contain,color: Theme.of(context).iconTheme.color,)),
         CardElement(onTap: ()=>print("hello"), title: "Android", icon: Icon(Icons.android)),
         CardElement(onTap: ()=>print("hello"),title: "Iphone", icon: Icon(Icons.phone_iphone)),
         CardElement(onTap: ()=>Navigator.pushNamed(context, Routes.animationListScreen),title: "Animation", icon: Icon(Icons.title)),
         CardElement(onTap: ()=>print("hello"), title: "Flutter Favrouite", icon:FlutterLogo()),
         CardElement(onTap: ()=>print("hello"),title: "Hello", icon: Icon(Icons.title)),
         CardElement(onTap: ()=>print("hello"), title: "Hello", icon: Icon(Icons.title)),
       ],
    );
  }


}


class CardElement extends StatelessWidget {
  final Function onTap;
  final String title;
  final dynamic icon;

  CardElement({@required this.onTap,@required this.title,@required this.icon}):assert(onTap!=null),
        assert(title!=null),assert(icon!=null);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40,
        decoration:const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),

        ),
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              icon,
              SizedBox(height: 8.0,),
              Text(title),
            ],
          ),
        ),
      ),
    );
  }
}
