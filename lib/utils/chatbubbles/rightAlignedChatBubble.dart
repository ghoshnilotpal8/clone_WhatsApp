import 'package:flutter/material.dart';
import '/constant.dart' as constant;
import '../../theme.dart';

Widget rightAlignedChatBubble(context, {required String text}) {
  return Padding(
    padding:
        EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.3, 10, 0, 10),
    child: Wrap(alignment: WrapAlignment.end, children: [
      Container(
        decoration: BoxDecoration(
            color: Color(constant.secondaryColor),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                topRight: Radius.circular(10))),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                text,
                style: lightTheme().textTheme.headline2,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.all(2.0),
                    child: Text(
                      "6:04am",
                      style: lightTheme().textTheme.subtitle1,
                    ),
                  ),
                  Icon(
                    Icons.done_all,
                    size: 18,
                    color: Colors.white,
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
