import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_page/reusable_widgets/item.dart';
import 'package:login_page/screens/home_screen.dart';
import 'package:login_page/utils/color_utils.dart';
import 'package:login_page/reusable_widgets/data.dart';

class Activityscreen extends StatefulWidget {
  const Activityscreen({Key? key}) : super(key: key);

  @override
  _ActivityscreenState createState() => _ActivityscreenState();
}

class _ActivityscreenState extends State<Activityscreen> {
 List<Object> notifications = [];

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
  //  sleep(const Duration(seconds: 15));
   // print(count1);
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            "Activity",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          // leading: IconButton(
          //   icon: const Icon(Icons.add),
          //   onPressed: () {
          //     setState(() {
          //       top.add(Image.asset("assets/images/$count.png"));
          //       count++;
          //     });
          //   },
          // ),
        ),
        body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              hexStringToColor("467199"),
              hexStringToColor("3E557F"),
              hexStringToColor("333462"),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            child:
                // SizedBox(
                //   height: 200,
                // ),

                   StreamBuilder(

                   stream: _dbref.onValue,
                      builder: (context, snap) {
                        didChangeDependencies();
                        return
                          ListView.builder(
                            itemCount: notifications.length,
                            itemBuilder: (BuildContext context, int indexpos) {
                              return
                                Text(indexpos.toString());
                              //   Item(
                              //   data: display.Datas[indexpos],
                              // );
                            },
                          );


     }) ));
  }

  Future getNotification() async {
    var notiRef = await FirebaseFirestore.instance.collection('notification')
        .doc('9ra80vupkSD8Nxb7R4Hu').collection('temp')
        .get();
    setState(() {
      notifications =
          List.from(notiRef.docs.map((doc) => Data.fromSnapshot(doc)));
    });
  }
}
