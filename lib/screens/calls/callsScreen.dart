import 'package:chat_app/utils/callsTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CallsScreen extends StatefulWidget {
  CallsScreen({Key? key}) : super(key: key);

  @override
  _CallsScreenState createState() => _CallsScreenState();
}

class _CallsScreenState extends State<CallsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // ? Add a listView build seperated like Chat screen and add a divider
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          callsTile(
              title: "title",
              numberOfEvent: "2",
              isMissed: false,
              date: "6 Aug",
              time: "6:10pm",
              isVideoCall: false),
          callsTile(
              title: "title",
              numberOfEvent: "1",
              isMissed: true,
              date: "6 Aug",
              time: "6:10pm",
              isVideoCall: false),
          callsTile(
              title: "title",
              numberOfEvent: "1",
              isMissed: true,
              date: "6 Aug",
              time: "6:10pm",
              isVideoCall: false),
          callsTile(
              title: "title",
              numberOfEvent: "1",
              isMissed: true,
              date: "6 Aug",
              time: "6:10pm",
              isVideoCall: true),
          callsTile(
              title: "title",
              numberOfEvent: "2",
              isMissed: true,
              date: "6 Aug",
              time: "6:10pm",
              isVideoCall: true)
        ],
      ),
    );
  }
}
