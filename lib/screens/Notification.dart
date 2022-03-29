import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_page/reusable_widgets/item.dart';
import 'package:login_page/utils/color_utils.dart';
import 'package:login_page/reusable_widgets/data.dart';

class Notificationscreen extends StatefulWidget {
  const Notificationscreen({Key? key}) : super(key: key);

  @override
  _NotificationscreenState createState() => _NotificationscreenState();
}

class _NotificationscreenState extends State<Notificationscreen> {
  List<Data> notifications = [];

  var k;

  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getNotification();
  }

  final DatabaseReference _dbref =
      FirebaseDatabase.instance.reference().child('tempandhumi/temp');

  var count = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            "Notification",
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
            child: SafeArea(
              child: StreamBuilder(
                  stream: _dbref.onValue,
                  builder: (context, snap) {
                    didChangeDependencies();
                    return ListView.builder(
                      itemCount: notifications.length,
                      itemBuilder: (BuildContext context, int indexpos) {
                        return Item(data: notifications[indexpos]);
                      },
                    );
                  }),
            )));
  }

  Future getNotification() async {
    var notiRef = await FirebaseFirestore.instance
        .collection('notification')
        .doc('9ra80vupkSD8Nxb7R4Hu')
        .collection('temp')
        .get();
    setState(() {
      notifications =
          List.from(notiRef.docs.map((doc) => Data.fromSnapshot(doc)));
    });
  }
}
