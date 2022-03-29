import 'package:firebase_database/firebase_database.dart';
import 'package:login_page/screens/Action.dart';
import 'package:login_page/screens/Notification.dart';
import 'package:login_page/screens/Settings.dart';
import 'package:login_page/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'Activity.dart';
class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  var _selectedIndex=0;


  final screens = [
    HomeScreen(),
    Actionscreen(),
    Activityscreen(),
    Notificationscreen(),
    Settingscreen(),


  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  bool isSwitched = false;
  final DatabaseReference _dbref = FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(

        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "B care",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body:  IndexedStack(
        index: _selectedIndex,
        children: screens,
      ) ,                   //Container(
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
                // title: Text('Home'),
                backgroundColor: const Color(0xFF333462)
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.call_to_action),
                label: "Action",
                 // : Text('Action'),
                backgroundColor: const Color(0xFF333462)
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_activity),
                label: "Activity",
              //title: Text('Activity'),
              backgroundColor: const Color(0xFF333462),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notification_important),
                label: "Notification",
             // title: Text('Notification'),
              backgroundColor: const Color(0xFF333462),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
                label: "Settings",
              //title: Text('Settings'),
              backgroundColor: const Color(0xFF333462),
            ),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          iconSize: 30,
          onTap: _onItemTapped,
          elevation: 100,
          showSelectedLabels: false,


      ),
    );
  }
}
