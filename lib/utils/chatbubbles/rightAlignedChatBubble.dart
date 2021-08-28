import 'package:flutter/material.dart';

Widget rightAlignedChatBubble(context, {required String text}) {
  return Padding(
    padding:
        EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.3, 10, 0, 10),
    child: Wrap(alignment: WrapAlignment.end, children: [
      Container(
        decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                topRight: Radius.circular(20))),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(text),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.all(2.0),
                    child: Text("6:04am"),
                  ),
                  Icon(
                    Icons.done_all,
                    size: 20,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    ]),
  );
}
