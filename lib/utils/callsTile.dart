import 'package:flutter/material.dart';

import '../theme.dart';

Widget callsTile(
    {required Function() onTap,
    required String title,
    required String numberOfEvent,
    required bool isMissed,
    required String date,
    required String time,
    required bool isVideoCall}) {
  return ListTile(
    onTap: onTap,
    leading: CircleAvatar(),
    title: Text(title),
    subtitle: Row(
      children: [
        isMissed
            ? Icon(
                Icons.south_west,
                color: Colors.redAccent.shade100,
              )
            : Icon(
                Icons.north_east,
                color: Colors.greenAccent,
              ),
        numberOfEvent == "1"
            ? Container()
            : Text(
                " ($numberOfEvent)",
                style: lightTheme().textTheme.subtitle2,
              ),
        Text(
          " $date,",
          style: lightTheme().textTheme.subtitle1,
        ),
        Text(
          " $time",
          style: lightTheme().textTheme.subtitle1,
        )
      ],
    ),
    trailing: isVideoCall
        ? Icon(
            Icons.videocam,
            color: Colors.white,
          )
        : Icon(
            Icons.call,
            color: Colors.white,
          ),
  );
}
