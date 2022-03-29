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
          title:Text(data.temp.toString()),
        subtitle: Text(data.Date.toString()),
      ),
    );
  }
}


