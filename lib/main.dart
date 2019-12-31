//Created by Ganesh Raut......

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart'; // this package is used to implement material design components.
import 'package:navigation_drawer_app/widgets_view/Page1.dart'; // this is used to import Page1 view widget.
import 'package:navigation_drawer_app/widgets_view/Page2.dart'; // this is used to import Page2 view widget.
import 'package:navigation_drawer_app/widgets_view/Page3.dart'; //this is used to import Page3 view widget.
import 'dart:io';
void main()=>runApp(new MyApp()); //this is the starting point of the execution.


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
    //scaffold widget is used to wrap the different types of material design components.
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Navigation Drawer App"),
          elevation: defaultTargetPlatform == TargetPlatform.android ?5.0 : 0.0,
        ) ,

      // drawer widget is used to create drawer.   
        drawer: new Drawer(
          // ListView is used to create  static list of items.  
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
              //ListTite widget is used to create to items in list view.
              new ListTile(
                   title: new Text("Settings"),//Text widget is used to define text.
                   //onTap widget is used for providing triggering an event.
                   onTap: () {
                     Navigator.of(context).pop(); // this statement is used to close the drawer.
                     Navigator.of(context).pushNamed("/a"); // this statement is used navigate to specified route or page.
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

            // Divider widget is used for separating the items or widgets.
              new Divider(),


               new ListTile(
                   title: new Text("SignOut"),
                   
                   onTap: () 
                   {
                     //Navigator.of(context).pop();
                     exit(0);
                   },
              ),
            
               new ListTile(
                   title: new Text("Close"),
                   trailing: new Icon(Icons.close),//Icon widget is used to set Icons for particular items.
                   onTap: ()=> Navigator.of(context).pop(),
              ),
            
              ],
          ),
        ),
        // Body define's the body of the application.
        body: new Container(
          child: new Center(
            child: new Text("Home Page"),
          ),
        ),
    );
  }
}