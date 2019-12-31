//Created by Ganesh Raut......

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:navigation_drawer_app/widgets_view/Page1.dart';
import 'package:navigation_drawer_app/widgets_view/Page2.dart';
import 'package:navigation_drawer_app/widgets_view/Page3.dart';
import 'dart:io';
void main()=>runApp(new MyApp());


class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context)
  {
    return new MaterialApp(
      theme: new ThemeData(primarySwatch: Colors.pink,
      primaryColor: defaultTargetPlatform == TargetPlatform.iOS ? Colors.grey[50] : null),
      home: new HomePage(),

      routes: <String,WidgetBuilder>{
        '/a':(BuildContext context) => new Page1("Settings Page"), 
        '/b':(BuildContext context) => new Page2("Notification Page"),
        '/c':(BuildContext context) => new Page3("Payment Page"),
        
      },

    );
  }
}

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context)
  {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Navigation Drawer App"),
          elevation: defaultTargetPlatform == TargetPlatform.android ?5.0 : 0.0,
        ) ,

        drawer: new Drawer(
          child: new ListView(
            children: <Widget>[
              new UserAccountsDrawerHeader(
                 accountName: new Text("Ganesh"),
                 accountEmail: new Text("ganesh@gmail.com"),
                 currentAccountPicture: new CircleAvatar(
                   backgroundColor: Theme.of(context).platform==TargetPlatform.iOS 
                   ? Colors.pink:Colors.white,
                   child: new Text("G"),
                 ),
                 otherAccountsPictures: <Widget>[
                   new CircleAvatar(
                      backgroundColor: Theme.of(context).platform==TargetPlatform.iOS 
                   ? Colors.pink:Colors.white,
                      child: new Text("A"),
                   ),
                 ],
              ),
              
              new ListTile(
                   title: new Text("Settings"),
                   
                   onTap: () {
                     Navigator.of(context).pop(); 
                     Navigator.of(context).pushNamed("/a");
                     },
              ),
              
               new ListTile(
                   title: new Text("Notifications"),
                   
                   onTap: (){
                     Navigator.of(context).pop();
                     Navigator.of(context).pushNamed("/b");
                   },
              ),

                new ListTile(
                   title: new Text("Payment method"),
                   
                   onTap: (){
                     Navigator.of(context).pop();
                     Navigator.of(context).pushNamed("/c");
                   },
              ),

              new Divider(),


               new ListTile(
                   title: new Text("SignOut"),
                   
                   onTap: () 
                   {//Navigator.of(context).pop();
                     exit(0);
                   },
              ),
            
               new ListTile(
                   title: new Text("Close"),
                   trailing: new Icon(Icons.close),
                   onTap: ()=> Navigator.of(context).pop(),
              ),
            
              ],
          ),
        ),
        body: new Container(
          child: new Center(
            child: new Text("Home Page"),
          ),
        ),
    );
  }
}