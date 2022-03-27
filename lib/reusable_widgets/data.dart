import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:login_page/screens/home_screen.dart';
int count = 1;

// class display {
//   static void  incrementCounter() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//
//     count = ((prefs.getInt('counter') ?? 0) + 1);
//     prefs.setInt('counter', count);
//
//
//
//   }
//   static fatchNoti() async {
//
//     print("fn : count:");
//     print(count);
//     final CollectionReference notiRef =
//         FirebaseFirestore.instance.collection('notification');
//     // var docSnapshot = await notiRef.doc('9ra80vupkSD8Nxb7R4Hu').get();
//     // sleep(const Duration(seconds: 3));
//     // if (docSnapshot.exists) {
//     //   Map<String, dynamic>? data = docSnapshot.data()! as Map<String, dynamic>?;
//     //
//     //   // You can then retrieve the value from the Map like this:
//     //   int name = data!['count'];
//     //   print("name:");
//     //   print(name);
//     //   count = name;
//     //   var datasnapshot = await notiRef.doc('9ra80vupkSD8Nxb7R4Hu').get();
//       //sleep(const Duration(seconds: 3));
//
//       for (int i = 0; i < count; i++) {
//         print("fne : count:");
//         print(count);
//         var datasnapshot = await notiRef
//             .doc('9ra80vupkSD8Nxb7R4Hu')
//             .collection('temp')
//             .doc('$i')
//             .get();
//         sleep(const Duration(seconds: 1));
//         Map<String, dynamic>? data =
//             datasnapshot.data()! as Map<String, dynamic>?;
//        // print(data!['temp']);
//         Data d = Data(temp: data!['temp'], Date: data['date']);
//         Datas.insert(0, d);
//         print("lenght");
//         print(Datas.length);
//
//       }
//     }
//
//
//    static addData() {
//    //sleep(const Duration(seconds: 15));
//     final CollectionReference notiRef =
//         FirebaseFirestore.instance.collection('notification');
//     // ({'text': 'data added through app'});
//     final now = new DateTime.now();
//     String formatter = DateFormat('yMd').format(now);
//     Datas.insert(0, Data(temp: displayText1, Date:formatter ));
//     print("add : count:");
//     print(count);
//     if(Datas.length>1) {
//       FirebaseFirestore.instance
//           .collection('notification')
//           .doc('9ra80vupkSD8Nxb7R4Hu')
//           .collection('temp')
//           .doc(count.toString())
//           .set({'temp': displayText1, 'date': Datas.last.Date});
//      // notiRef.doc('9ra80vupkSD8Nxb7R4Hu').set({'count': count});
//       incrementCounter();
//
//       print("incremented count");
//       print(count);
//     }
//   }
//
//   static final Datas = [
//     //  Data(
//     //    temp: displayText1,
//     //    now: DateTime.now()
//     // ),
//   ];
// }

class Data {
   String? temp;
   String? Date ;
 // final String time;
  // = DateTime.now();

  // Data({required this.temp,});
Data();
Map<String,dynamic> toJson() => {'temp': temp,'date':Date };
 // Data({required this.temp, required this.Date});
Data.fromSnapshot(snapshot)
  :temp = snapshot.data()['temp'],
   Date = snapshot.data()['date'];

}
