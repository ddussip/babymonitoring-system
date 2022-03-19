import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:login_page/utils/color_utils.dart';
import 'Activity.dart';
import 'Notification.dart';
import 'Settings.dart';
import 'home_screen.dart';
class Actionscreen extends StatefulWidget {
  const Actionscreen({Key? key}) : super(key: key);

  @override
  _ActionscreenState createState() => _ActionscreenState();
}

class _ActionscreenState extends State<Actionscreen> {
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
          "Action",
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
                height:200,
              ),
              Switch(
                  value: isSwitched,
                  onChanged: (value) async {
                    setState(() {
                      isSwitched = value;
                      print(isSwitched);
                    });
                    await _dbref.update({'signal': isSwitched});
                  }

              ),
            ],
          ),
        ),

      ),


    );
  }
}