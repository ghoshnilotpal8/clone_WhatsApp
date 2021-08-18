import 'package:flutter/material.dart';

Widget myStatusTile() {
  return ListTile(
    contentPadding: EdgeInsets.only(left: 0),
    leading: Stack(
      children: [CircleAvatar()],
    ),
    title: Text("My Status"),
    subtitle: Text("Tap to add status update"),
  );
}
