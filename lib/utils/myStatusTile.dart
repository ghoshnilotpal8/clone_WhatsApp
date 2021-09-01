import 'package:flutter/material.dart';

import '../theme.dart';

Widget myStatusTile() {
  return ListTile(
    contentPadding: EdgeInsets.only(left: 0),
    leading: Stack(
      children: [CircleAvatar()],
    ),
    title: Text(
      "My Status",
      style: lightTheme().textTheme.headline2,
    ),
    subtitle: Text(
      "Tap to add status update",
      style: lightTheme().textTheme.headline4,
    ),
  );
}
