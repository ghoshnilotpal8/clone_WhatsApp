import 'dart:io';
import 'dart:ui';
import 'dart:math' as math;
import 'package:chat_app/constant.dart' as constant;
import 'package:chat_app/theme.dart';

import 'package:chat_app/utils/chatbubbles/leftAlignedChatBubble.dart';
import 'package:chat_app/utils/chatbubbles/rightAlignedChatBubble.dart';
import 'package:chat_app/utils/timer/timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';

class ConversationScreen extends StatefulWidget {
  ConversationScreen({Key? key}) : super(key: key);

  @override
  _ConversationScreenState createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen>
    with TickerProviderStateMixin {
  late TextEditingController _textEditingController;
  bool isRecording = false, isMicLocked = false;
  late AnimationController _micButtonAnimationController,
      _countdownController,
      _slideToCancelAnimationController,
      _destroyMicController;
  late Animation _animation,
      _micButtonScaleAnimation,
      _slideToCancel,
      _destroyMicIcon,
      _micRoation;
  late FocusNode _textFieldFocusNode;
  int levelClock = 120;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    _countdownController = AnimationController(
        vsync: this, duration: Duration(seconds: levelClock))
      ..addListener(() {
        if (_countdownController.isCompleted) {
          setState(() {
            isRecording = false;
            isMicLocked = false;
          });
        }
      });
    _micButtonAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    _slideToCancelAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    _destroyMicController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    _micButtonScaleAnimation = Tween<double>(begin: 1, end: 1.7)
        .animate(_micButtonAnimationController);
    _animation = Tween<double>(
      begin: window.physicalSize.width / window.devicePixelRatio,
      end: (window.physicalSize.width / window.devicePixelRatio) * 0.85,
    ).animate(CurvedAnimation(
        parent: _micButtonAnimationController, curve: Curves.bounceIn));
    _slideToCancel = Tween<double>(begin: 0.0, end: 10.0)
        .animate(_slideToCancelAnimationController);
    _destroyMicIcon = TweenSequence([
      TweenSequenceItem(tween: Tween<double>(begin: 0.0, end: -50), weight: 1),
      TweenSequenceItem(tween: Tween<double>(begin: -50, end: 100), weight: 1)
    ]).animate(_destroyMicController);
    _micRoation = Tween<double>(begin: 180, end: 1).animate(CurvedAnimation(
        parent: _destroyMicController, curve: Interval(0.1, 0.3)));
    _textFieldFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _micButtonAnimationController.dispose();
    _textFieldFocusNode.dispose();
    _countdownController.dispose();
    _slideToCancelAnimationController.dispose();
    _destroyMicController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CircleAvatar(),
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
              color: Color(constant.darkerPrimaryColor),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Stack(
                  children: [
                    isRecording
                        ? Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50)),
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 15),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          AnimatedBuilder(
                                              animation: _destroyMicController,
                                              builder: (context, child) {
                                                return Transform.translate(
                                                  offset: Offset(
                                                      0, _destroyMicIcon.value),
                                                  child: Transform.rotate(
                                                    angle: -math.pi /
                                                        _micRoation.value,
                                                    child: Icon(Icons.mic,
                                                        color: Colors.white),
                                                  ),
                                                );
                                              }),
                                          Countdown(
                                            animation: StepTween(
                                                    begin: levelClock, end: 0)
                                                .animate(_countdownController),
                                          ),
                                        ],
                                      ),
                                      !isMicLocked
                                          ? AnimatedBuilder(
                                              animation:
                                                  _slideToCancelAnimationController,
                                              builder: (context, child) {
                                                return Transform.translate(
                                                  offset: Offset(
                                                      _slideToCancel.value, 0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Icon(Icons.chevron_left,
                                                          color: Colors.white),
                                                      Text(
                                                        "Slide to cancel",
                                                        style: lightTheme()
                                                            .textTheme
                                                            .headline2,
                                                      )
                                                    ],
                                                  ),
                                                );
                                              })
                                          : Container(),
                                      isMicLocked
                                          ? InkWell(
                                              onTap: () {
                                                setState(() {
                                                  isRecording = false;
                                                  isMicLocked = false;
                                                });
                                                _countdownController.reset();
                                              },
                                              child: Text(
                                                "Cancel",
                                                style: TextStyle(
                                                    color: Colors.red),
                                              ))
                                          : Container()
                                    ],
                                  ),
                                )),
                          )
                        : Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: TextFormField(
                                focusNode: _textFieldFocusNode,
                                controller: _textEditingController,
                                decoration: InputDecoration(
                                  prefixIcon: IconButton(
                                    icon: Icon(
                                      Icons.emoji_emotions_outlined,
                                      color: Color(constant.secondaryColor),
                                    ),
                                    onPressed: () {},
                                  ),
                                  suffixIcon: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.attach_file,
                                            color:
                                                Color(constant.secondaryColor),
                                          )),
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.camera_alt,
                                            color:
                                                Color(constant.secondaryColor),
                                          )),
                                    ],
                                  ),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(50)),
                                  hintText: "Type a message",
                                ),
                                onChanged: (res) {
                                  if (res.length < 1) {
                                    setState(() {
                                      isMicLocked = false;
                                    });
                                  } else {
                                    setState(() {
                                      isMicLocked = true;
                                    });
                                  }
                                },
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            ),
          ),
          isMicLocked ? sendWidget() : micWidget(),
          lockIcon()
        ],
      ),
    );
  }

  Widget lockIcon() {
    return AnimatedBuilder(
        animation: _micButtonAnimationController,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(
                _animation.value, MediaQuery.of(context).size.height * 0.6),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Icon(
                Icons.lock,
                color: Colors.white,
              ),
            ),
          );
        });
  }

  Widget sendWidget() {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: GestureDetector(
          onTap: () {
            print("Send message");
            _textEditingController.clear();
            setState(() {
              isRecording = false;
              isMicLocked = false;
            });
            _countdownController.reset();
          },
          child: AnimatedBuilder(
              animation: _micButtonAnimationController,
              builder: (context, child) {
                return Align(
                  alignment: Alignment.bottomRight,
                  child: Transform.scale(
                    scale: _micButtonScaleAnimation.value,
                    child: Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: Color(constant.secondaryColor),
                            borderRadius: BorderRadius.circular(100)),
                        child: Icon(Icons.send, color: Colors.white)),
                  ),
                );
              }),
        ),
      ),
    );
  }

  Widget micWidget() {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: GestureDetector(
          onVerticalDragEnd: (val) {
            _micButtonAnimationController.reverse();
            _slideToCancelAnimationController.stop();
          },
          onTap: () {
            print("Tap and Hold");
          },
          onLongPress: () {
            _micButtonAnimationController.forward();
            _slideToCancelAnimationController.repeat(reverse: true);
            _countdownController.forward();
            setState(() {
              isRecording = true;
            });
          },
          onLongPressEnd: (_) {
            _micButtonAnimationController.reverse().then((value) {
              if (isMicLocked) {
                setState(() {
                  isRecording = true;
                });
              } else {
                setState(() {
                  isRecording = false;
                });
                _countdownController.reset();
              }
            });
          },
          child: Listener(
              onPointerMove: (PointerMoveEvent movememtEvent) {
                lockMicFunction(movememtEvent);
              },
              child: AnimatedBuilder(
                  animation: _micButtonAnimationController,
                  builder: (context, child) {
                    return Align(
                      alignment: Alignment.bottomRight,
                      child: Transform.scale(
                        scale: _micButtonScaleAnimation.value,
                        child: Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                color: Color(constant.secondaryColor),
                                borderRadius: BorderRadius.circular(100)),
                            child: Icon(
                              Icons.mic,
                              color: Colors.white,
                            )),
                      ),
                    );
                  })),
        ),
      ),
    );
  }

  lockMicFunction(PointerMoveEvent movememtEvent) {
    if (movememtEvent.position.dy - 150 <=
        MediaQuery.of(context).size.height * 0.6) {
      // ? Start recording
      HapticFeedback.lightImpact();
      _micButtonAnimationController.reverse();
      setState(() {
        isMicLocked = true;
      });
    } else if (movememtEvent.position.dx <=
        MediaQuery.of(context).size.width * 0.4) {
      // ? cancel recording
      HapticFeedback.lightImpact();
      _destroyMicController.forward().then((value) {
        _micButtonAnimationController.reverse().then((value) {
          setState(() {
            isRecording = false;
          });
          _countdownController.reset();
          _destroyMicController.reset();
        });
      });
    }
  }
}
