import 'package:chat_app/theme.dart';
import 'package:flutter/material.dart';
// import 'package:chat_app/constant.dart' as constant;

Widget chatTile(BuildContext context) {
  return Padding(
    padding: EdgeInsets.all(10.0),
    child: SizedBox(
      height: MediaQuery.of(context).size.height * 0.06,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(flex: 1, child: CircleAvatar()),
          Expanded(
            flex: 9,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Nilotpal Ghosh",
                        style: lightTheme().textTheme.headline2,
                      ),
                      Text(
                        "6:14 pm",
                        style: lightTheme().textTheme.subtitle1,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 5.0),
                        child: Icon(
                          Icons.done_all,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Hey, How are you man ?",
                        style: lightTheme().textTheme.headline4,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
