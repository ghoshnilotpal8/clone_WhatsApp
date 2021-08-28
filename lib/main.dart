import 'package:chat_app/screens/calls/callsScreen.dart';
import 'package:chat_app/screens/camera/cameraScreen.dart';
import 'package:chat_app/screens/chat/chatsScreen.dart';
import 'package:chat_app/screens/status/statusScreen.dart';
import 'package:flutter/material.dart';
import 'constant.dart' as constant;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat App UI',
      home: MainScreen(title: constant.HomePageTitle),
    );
  }
}

class MainScreen extends StatefulWidget {
  MainScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController _scrollController;
  late AnimationController _miniFabAnimationController;
  late Animation<double> _miniFabAnimation;
  double scrollOfset = 0.0;
  int globalIndexForFAB = 1;
  final screenList = <Widget>[
    CameraScreen(),
    ChatsScreen(),
    StatusScreen(),
    CallsScreen()
  ];

  @override
  void initState() {
    super.initState();
    _miniFabAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _miniFabAnimation =
        Tween<double>(begin: 0, end: -60).animate(_miniFabAnimationController);
    _scrollController = ScrollController(initialScrollOffset: scrollOfset);
    _tabController =
        TabController(length: screenList.length, vsync: this, initialIndex: 1)
          ..addListener(() {
            tabAndAppbarAnimation();
            miniFabAnimationControllerListner();
            setState(() {
              globalIndexForFAB = _tabController.index;
            });
          });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  iconSelectionFunction() {
    if (_tabController.index == 1) {
      return Icon(Icons.message);
    } else if (_tabController.index == 2) {
      return Icon(Icons.camera_alt);
    } else if (_tabController.index == 3) {
      return Icon(Icons.add_call);
    } else {
      return Container();
    }
  }

  tabAndAppbarAnimation() {
    if (_tabController.index == 0) {
      _scrollController.animateTo(150.0,
          duration: Duration(milliseconds: 450), curve: Curves.ease);
    } else if (_tabController.index == 1) {
      _scrollController.animateTo(0.0,
          duration: Duration(milliseconds: 450), curve: Curves.ease);
    }
  }

  miniFabAnimationControllerListner() {
    print(_tabController.index);
    _tabController.index == 2
        ? _miniFabAnimationController.forward()
        : _miniFabAnimationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          body: body(),
          floatingActionButton: _tabController.index == 0 ? Container() : fab(),
        ));
  }

  Widget body() {
    return NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              actions: [
                IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
              ],
              title: Text(widget.title),
              pinned: false,
              floating: true,
              bottom: TabBar(
                onTap: (i) {
                  _tabController.animateTo(i);
                },
                indicatorSize: TabBarIndicatorSize.tab,
                controller: _tabController,
                tabs: [
                  Icon(Icons.camera_alt),
                  Tab(
                    text: "CHATS",
                  ),
                  Tab(
                    text: "STATUS",
                  ),
                  Tab(
                    text: "CALLS",
                  ),
                ],
              ),
            )
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: screenList,
        ));
  }

  Widget fab() {
    return Stack(
      children: [
        AnimatedBuilder(
            animation: _miniFabAnimationController,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(4, _miniFabAnimation.value),
                child: FloatingActionButton(
                  mini: true,
                  onPressed: () {},
                  tooltip: 'add status',
                  child: Icon(Icons.edit),
                  heroTag: null,
                ),
              );
            }),
        FloatingActionButton(
          onPressed: () {},
          tooltip: 'Action',
          child: iconSelectionFunction(),
          heroTag: null,
        ),
      ],
    );
  }
}
