import 'package:flutter/material.dart';
import '/constant.dart' as constant;
import '../../theme.dart';

Widget leftAlignedChatBubble(context, {required String text}) {
  return Padding(
    padding:
        EdgeInsets.fromLTRB(0, 10, MediaQuery.of(context).size.width * 0.3, 10),
    child: Wrap(alignment: WrapAlignment.start, children: [
      Container(
        decoration: BoxDecoration(
            color: Color(constant.primaryColor),
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                topRight: Radius.circular(10))),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: lightTheme().textTheme.headline2,
              ),
              Padding(
                padding: EdgeInsets.all(2.0),
                child: Text(
                  "6:04am",
                  style: lightTheme().textTheme.subtitle1,
                ),
              ),
            ],
          ),
        ),
      ),
    ]),
  );
}
