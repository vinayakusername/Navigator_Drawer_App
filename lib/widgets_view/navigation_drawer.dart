//Created by Ganesh Raut......

import 'package:flutter/foundation.dart';//this package conatain lowest level utility classes and functions used by other layers of flutter framework. 
import 'package:flutter/material.dart'; // this package is used to implement material design components.
import 'package:navigation_drawer_app/widgets_view/Page1.dart'; // this is used to import Page1 view widget.
import 'package:navigation_drawer_app/widgets_view/Page2.dart'; // this is used to import Page2 view widget.
import 'package:navigation_drawer_app/widgets_view/Page3.dart'; //this is used to import Page3 view widget.
import 'dart:io';


//stateless is a widget which has immutable state(It is information that can be read synchronously when the widget is built) when user interacts with it
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) //this build function is used to build the widget.
  {
    return new MaterialApp(
      theme: new ThemeData(primarySwatch: Colors.pink,
      primaryColor: defaultTargetPlatform == TargetPlatform.iOS ? Colors.grey[50] : null),
      home: new HomePage(),
      //The routes property defines the available named routes and 
      //the widgets to build when navigating to those routes.
      routes: <String,WidgetBuilder>{
        // When navigating to the "/a" route, build the Settings Page widget.
        '/a':(BuildContext context) => new Page1("Settings Page"),
         // When navigating to the "/b" route, build the Notification widget. 
        '/b':(BuildContext context) => new Page2("Notification Page"),
         // When navigating to the "/c" route, build the Payment Page widget.
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
          //elevation property is used to set elevation to AppBar in Android Device.
          elevation: defaultTargetPlatform == TargetPlatform.android ?5.0 : 0.0,
        ) ,

      // drawer widget is used to create drawer.   
        drawer: new Drawer(
          // ListView is used to create  static list of items.  
          child: new ListView(
            children: <Widget>[
              //useraccountsdrawerheader is used to show user accounts details on drawer.
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
                     Navigator.of(context).pushNamed("/a"); // this statement is used navigate to specified route or page using named route='/a'.
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