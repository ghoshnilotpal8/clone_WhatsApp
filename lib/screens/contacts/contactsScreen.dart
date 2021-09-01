import 'package:chat_app/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';

class ContactsScreen extends StatefulWidget {
  ContactsScreen({Key? key}) : super(key: key);

  @override
  _ContactsScreenState createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  @override
  Widget build(BuildContext context) {
    final String? isFromChatScreen = context.vRouter.pathParameters['fromChat'];
    return Scaffold(
      appBar: AppBar(
        title: Text("Select contact"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
        ],
      ),
      body: body(isFromChatScreen),
    );
  }

  Widget body(isFromChatScreen) {
    return ListView(
      children: [
        ListTile(
          leading: CircleAvatar(child: Icon(Icons.group)),
          title: isFromChatScreen == 'True'
              ? Text(
                  "New group",
                  style: lightTheme().textTheme.headline2,
                )
              : Text(
                  "New group call",
                  style: lightTheme().textTheme.headline2,
                ),
        ),
        ListTile(
          leading: CircleAvatar(child: Icon(Icons.person)),
          title: Text(
            "New contact",
            style: lightTheme().textTheme.headline2,
          ),
          trailing: IconButton(
            icon: Icon(Icons.qr_code_sharp, color: Colors.white),
            onPressed: () {},
          ),
        ),
        ListTile(
          onTap: () {
            if (isFromChatScreen == 'True') {
              context.vRouter.to('chat');
            }
          },
          leading: CircleAvatar(),
          title: Text(
            "Contact name",
            style: lightTheme().textTheme.headline2,
          ),
          subtitle: Text(
            "Status",
            style: lightTheme().textTheme.headline4,
          ),
          trailing: isFromChatScreen == 'True'
              ? null
              : Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: () {
                          context.vRouter.to('onCall');
                        },
                        icon: Icon(
                          Icons.add_call,
                          color: Colors.white,
                        )),
                    IconButton(
                      onPressed: () {
                        context.vRouter.to('onCall');
                      },
                      icon: Icon(
                        Icons.videocam_rounded,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
        )
      ],
    );
  }
}
