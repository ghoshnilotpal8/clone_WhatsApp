import 'package:chat_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '/constant.dart' as constant;

class OnCallScreen extends StatefulWidget {
  OnCallScreen({Key? key}) : super(key: key);

  @override
  _OnCallScreenState createState() => _OnCallScreenState();
}

class _OnCallScreenState extends State<OnCallScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(),
    );
  }

  Widget body() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [topSection(), middleSection(), bottomSection()],
    );
  }

  Widget topSection() {
    return Expanded(
        flex: 2,
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Color(constant.primaryColor),
          child: SafeArea(
            bottom: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                CircleAvatar(
                  radius: MediaQuery.of(context).size.width * 0.09,
                ),
                Text(
                  "Username",
                  style: lightTheme().textTheme.headline2,
                ),
                Text(
                  "00:00",
                  style: lightTheme().textTheme.subtitle2,
                )
              ],
            ),
          ),
        ));
  }

  Widget middleSection() {
    return Expanded(
        flex: 8,
        child: Container(
          color: Colors.white,
          child: Center(
            child: CircleAvatar(
              radius: MediaQuery.of(context).size.width * 0.2,
              child: Icon(
                Icons.person,
                size: 80,
              ),
            ),
          ),
        ));
  }

  Widget bottomSection() {
    return Expanded(
        flex: 1,
        child: Container(
          color: Color(constant.primaryColor),
          child: SafeArea(
            top: false,
            child: Padding(
              padding: EdgeInsets.only(top: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.videocam_off_outlined,
                        color: Colors.white,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.mic_off_outlined,
                        color: Colors.white,
                      )),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(constant.secondaryColor)),
                    child: Icon(
                      Icons.call_end,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.chat_bubble_outline_rounded,
                        color: Colors.white,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.add_ic_call_outlined,
                        color: Colors.white,
                      ))
                ],
              ),
            ),
          ),
        ));
  }
}
