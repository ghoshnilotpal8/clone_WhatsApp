import 'package:flutter/material.dart';

Widget leftAlignedChatBubble(context, {required String text}) {
  return Padding(
    padding:
        EdgeInsets.fromLTRB(0, 10, MediaQuery.of(context).size.width * 0.3, 10),
    child: Wrap(alignment: WrapAlignment.start, children: [
      Container(
        decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                topRight: Radius.circular(20))),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(text),
              Padding(
                padding: EdgeInsets.all(2.0),
                child: Text("6:04am"),
              ),
            ],
          ),
        ),
      ),
    ]),
  );
}
