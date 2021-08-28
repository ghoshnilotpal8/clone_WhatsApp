import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:chat_app/utils/chatbubbles/leftAlignedChatBubble.dart';
import 'package:chat_app/utils/chatbubbles/rightAlignedChatBubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ConversationScreen extends StatefulWidget {
  ConversationScreen({Key? key}) : super(key: key);

  @override
  _ConversationScreenState createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen>
    with TickerProviderStateMixin {
  late TextEditingController _textEditingController;
  bool longPressed = false;
  late AnimationController _micAnimationController;
  late Animation _animation, _micButtonScaleAnimation;
  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    _micAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    _micButtonScaleAnimation =
        Tween<double>(begin: 1, end: 1.7).animate(_micAnimationController);
    _animation = Tween<double>(
      begin: window.physicalSize.width / window.devicePixelRatio,
      end: (window.physicalSize.width / window.devicePixelRatio) * 0.85,
    ).animate(CurvedAnimation(
        parent: _micAnimationController, curve: Curves.bounceIn));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CircleAvatar(),
        centerTitle: Platform.isIOS ? true : false,
        actions: [
          IconButton(
              onPressed: () {
                Platform.isIOS
                    ? PopupMenuButton(
                        onSelected: (result) {
                          print(result);
                        },
                        itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                              const PopupMenuItem(
                                value: "View contact",
                                child: Text('View contact'),
                              ),
                            ])
                    : PopupMenuButton(itemBuilder: (BuildContext context) {
                        return <PopupMenuEntry>[
                          const PopupMenuItem(
                            value: "View contact",
                            child: Text('View contact'),
                          ),
                          const PopupMenuItem(
                            value: "View contact",
                            child: Text('View contact'),
                          ),
                          const PopupMenuItem(
                            value: "View contact",
                            child: Text('View contact'),
                          ),
                          const PopupMenuItem(
                            value: "View contact",
                            child: Text('View contact'),
                          ),
                        ];
                      });
              },
              icon: Icon(Icons.more_vert))
        ],
      ),
      body: body(),
    );
  }

  Widget body() {
    return SafeArea(
      child: Stack(
        children: [
          Container(
            color: Colors.black87,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * 0.08,
                  left: 10,
                  right: 10),
              reverse: true,
              children: [
                rightAlignedChatBubble(context, text: "Hola"),
                leftAlignedChatBubble(context, text: "Hi")
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.07),
              color: Colors.grey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextFormField(
                          controller: _textEditingController,
                          decoration: InputDecoration(
                              prefixIcon: IconButton(
                                icon: Icon(Icons.emoji_emotions_outlined),
                                onPressed: () {},
                              ),
                              suffixIcon: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.attach_file)),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.camera_alt)),
                                ],
                              ),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(50)),
                              hintText: "Type a message",
                              filled: true),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          micWidget(),
          lockIcon()
        ],
      ),
    );
  }

  Widget lockIcon() {
    return AnimatedBuilder(
        animation: _micAnimationController,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(
                _animation.value, MediaQuery.of(context).size.height * 0.6),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Icon(Icons.lock_open),
            ),
          );
        });
  }

  Widget micWidget() {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: GestureDetector(
          onVerticalDragEnd: (val) {
            _micAnimationController.reverse();
            setState(() {
              longPressed = false;
            });
          },
          onTapDown: (_) {
            Future.delayed(Duration(milliseconds: 450), () {
              _micAnimationController.forward();
            });
          },
          onTapUp: (_) {
            _micAnimationController.reverse();
          },
          child: Listener(
              onPointerMove: (PointerMoveEvent movememtEvent) {
                lockMicFunction(movememtEvent);
              },
              child: AnimatedBuilder(
                  animation: _micAnimationController,
                  builder: (context, child) {
                    return Align(
                      alignment: Alignment.bottomRight,
                      child: Transform.scale(
                        scale: _micButtonScaleAnimation.value,
                        child: Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(100)),
                            child: Icon(Icons.mic)),
                      ),
                    );
                  })),
        ),
      ),
    );
  }

  lockMicFunction(PointerMoveEvent movememtEvent) {
    // print(movememtEvent.distance);
    // print(movememtEvent.delta.direction);
  }
}
