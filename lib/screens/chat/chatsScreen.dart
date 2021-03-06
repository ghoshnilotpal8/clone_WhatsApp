import 'package:chat_app/utils/chatsTile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vrouter/vrouter.dart';

class ChatsScreen extends StatefulWidget {
  ChatsScreen({Key? key}) : super(key: key);

  @override
  _ChatsScreenState createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.separated(
            padding: EdgeInsets.zero,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                  onTap: () {
                    context.vRouter.to('chat');
                  },
                  child: chatTile(context));
            },
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                endIndent: 50,
                indent: 50,
              );
            },
            itemCount: 10));
  }
}
