import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ConversationScreen extends StatefulWidget {
  ConversationScreen({Key? key}) : super(key: key);

  @override
  _ConversationScreenState createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CircleAvatar(),
        centerTitle: Platform.isIOS ? true : false,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.video_camera_front)),
          IconButton(onPressed: () {}, icon: Icon(Icons.call)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
        ],
      ),
      body: body(),
    );
  }

  Widget body() {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 9,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ListView(
                reverse: true,
                children: [Text("Hi")],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextField(
                      autofocus: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(50)),
                          hintText: "Type a message",
                          prefix: Icon(Icons.emoji_emotions),
                          filled: true,
                          fillColor: Colors.grey.shade800,
                          suffix: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(Icons.camera_alt),
                              Icon(Icons.attach_email)
                            ],
                          )),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.amber, shape: BoxShape.circle),
                    child: Icon(Icons.mic),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
