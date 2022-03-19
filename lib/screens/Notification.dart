import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:login_page/utils/color_utils.dart';
class Notificationscreen extends StatefulWidget {
  const Notificationscreen({Key? key}) : super(key: key);

  @override
  _NotificationscreenState createState() => _NotificationscreenState();
}

class _NotificationscreenState extends State<Notificationscreen> {
  @override
  bool isSwitched = false;
  final DatabaseReference _dbref = FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Notifications",
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
            ],
          ),
        ),

      ),
    );
  }
}