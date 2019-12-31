import 'package:flutter/material.dart';



class Page2 extends StatelessWidget{

  final String title;

  Page2(this.title);

  @override
  Widget build(BuildContext context)
  {
    return new Scaffold(
     appBar: new AppBar(
       title: new Text(title),
     ),
     body: new Center(
       child: new Text(title),
     ),
    );
  }
  
}