import 'package:flutter/material.dart';

Widget callsTile(
    {required String title,
    required String numberOfEvent,
    required bool isMissed,
    required String date,
    required String time,
    required bool isVideoCall}) {
  return ListTile(
    leading: CircleAvatar(),
    title: Text(title),
    subtitle: Row(
      children: [
        isMissed
            ? Icon(
                Icons.south_west,
                color: Colors.red,
              )
            : Icon(
                Icons.north_east,
                color: Colors.green,
              ),
        numberOfEvent == "1" ? Container() : Text(" ($numberOfEvent)"),
        Text(" $date,"),
        Text(" $time")
      ],
    ),
    trailing: isVideoCall ? Icon(Icons.videocam) : Icon(Icons.call),
  );
}
