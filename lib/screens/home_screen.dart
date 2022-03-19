import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:login_page/screens/Action.dart';
import 'package:login_page/screens/Notification.dart';
import 'package:login_page/screens/Settings.dart';
import 'package:flutter/material.dart';
import 'package:login_page/utils/color_utils.dart';
import 'package:video_player/video_player.dart';
import 'Activity.dart';
String displayText1 = 'Please wait for a while';
String displayText2 = 'Please wait for a while';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  static var data ;
  final DatabaseReference _dbref = FirebaseDatabase.instance.reference();
  //late StreamSubscription _update;
  @override
  void initState() {
    super.initState();
    _activateListeners();
  }
  void _activateListeners() {
   _dbref.child('tempandhumi').onValue.listen((event){
     final String temp =event.snapshot.child('temp').value.toString() ;
     final String temp1 =event.snapshot.child('humidity').value.toString() ;
     // final temp=event.snapshot.value;
   data=temp;
   setState(() {
        print(temp);
        print(data);
        displayText1 = '$data';
        displayText2=temp1;
     });
  }

  );
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Home",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          hexStringToColor("467199"),
          hexStringToColor("3E557F"),
          hexStringToColor("333462"),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Center(
          child: Column(
            children: <Widget>[
                const SizedBox(
                height: 150,
                ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:  <Widget>[

                Expanded(child: Icon(CupertinoIcons.thermometer)),
                Expanded(child: Text(displayText1)),
                Text('|'),
                Expanded(child: Icon(CupertinoIcons.drop)),
                Expanded(child: Text(displayText2))

    ]
              ),
            ],
          ),

        ),
      ),
    );
  }
}
