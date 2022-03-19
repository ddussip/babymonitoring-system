import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_page/utils/color_utils.dart';
import 'package:video_player/video_player.dart';
import 'Action.dart';
import 'Notification.dart';
import 'Settings.dart';
import 'home_screen.dart';
class Activityscreen extends StatefulWidget {
  const Activityscreen({Key? key}) : super(key: key);

  @override
  _ActivityscreenState createState() => _ActivityscreenState();
}

class _ActivityscreenState extends State<Activityscreen> {
  int count1=0;
  // List<Image> top = <Image>[];
  // List<Image> f_base=<Image>[];
  List<Widget> s= <Widget>[];
  var k;
  void initState() {
    super.initState();
  }
  final DatabaseReference _dbref = FirebaseDatabase.instance.reference().child('tempandhumi/temp');

  var count=1;
  @override
  Widget build(BuildContext context) {
    print(count1);
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
        child: Column(
          children: <Widget>[
            StreamBuilder(
              stream: _dbref.onValue,
              builder: (context, snap) {
                count1++;
                  //s.add(Card(child: ListTile(title : Text('hello'))));
                  return Expanded(
                    child: ListView.builder(
                      itemCount: count1,
                      itemBuilder: (context, index) {
                        return Column(
                          children: <Widget>[
                            Text("hello"),
                            Text("hii"),
                          ],
                        );
                        //   ListTile(
                        //   title: Text('hii'),
                        // );
                      },
                    ),
                  );

              },
            )

          ],
        ),
          ),
        );


  }
}
