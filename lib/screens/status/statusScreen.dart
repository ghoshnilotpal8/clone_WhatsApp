import 'package:chat_app/utils/myStatusTile.dart';
import 'package:chat_app/screens/status/statusPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
            InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return StatusPage();
                  }));
                },
                child: myStatusTile()),
            Text(
              "Recent updates",
              style: lightTheme().textTheme.subtitle2,
            ),
            myStatusTile(),
            myStatusTile()
          ],
        ),
      ),
    );
  }
}
