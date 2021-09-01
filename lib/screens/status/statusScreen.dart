import 'package:chat_app/utils/myStatusTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vrouter/vrouter.dart';

import '../../theme.dart';

class StatusScreen extends StatefulWidget {
  StatusScreen({Key? key}) : super(key: key);

  @override
  _StatusScreenState createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            myStatusTile(onTap: () {
              context.vRouter.to('status');
            }),
            Text(
              "Recent updates",
              style: lightTheme().textTheme.subtitle2,
            ),
            myStatusTile(onTap: () {}),
            myStatusTile(onTap: () {})
          ],
        ),
      ),
    );
  }
}
