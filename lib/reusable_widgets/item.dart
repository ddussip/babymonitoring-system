import 'package:flutter/material.dart';

import 'data.dart';
class Item extends StatelessWidget {
  final Data data;
  const Item({Key? key, required this.data})
      : assert(data!=null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
          title:Text("hello"),
        subtitle: Text(data.Date.toString()),
      ),
    );
  }
}
// class Item extends StatefulWidget {
//   const Item({Key? key}) : super(key: key);
//
//   @override
//   _ItemState createState() => _ItemState();
// }
//
// class _ItemState extends State<Item> {
//   late final Data data;
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       leading: Text(data.temp),
//     );;
//   }
// }

