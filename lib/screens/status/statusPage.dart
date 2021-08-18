import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StatusPage extends StatefulWidget {
  StatusPage({Key? key}) : super(key: key);

  @override
  _StatusPageState createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> with TickerProviderStateMixin {
  int numberOfStories = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            statusView(),
            topContent(),
            bottomContent(),
            nextOrPrevStatusDecider()
          ],
        ),
      ),
    );
  }

  Widget statusView() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Container(
        color: Colors.amber,
      ),
    );
  }

  Widget topContent() {
    return SafeArea(
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.2,
          child: Column(
            children: [
              Row(
                children: List.generate(
                    numberOfStories,
                    (index) => Expanded(
                        child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 2),
                            child: LinearProgressIndicator()))),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.arrow_back))),
                    Expanded(
                        flex: 6,
                        child: ListTile(
                          contentPadding: EdgeInsets.only(left: 0),
                          leading: CircleAvatar(),
                          title: Text("Name"),
                          subtitle: Text("7:05 pm"),
                        )),
                    Expanded(
                        flex: 2,
                        child: IconButton(
                            onPressed: () {
                              print("****");
                            },
                            icon: Icon(Icons.more_vert)))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomContent() {
    return SafeArea(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.2,
          color: Colors.red.withOpacity(0.4),
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text("Status text"),
                ),
                Icon(Icons.arrow_upward),
                Text("Reply")
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget nextOrPrevStatusDecider() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Expanded(
              flex: 5,
              child: GestureDetector(
                onTap: () {
                  // ? Previous status logic but don't exit from Page
                },
                child: Container(),
              )),
          Expanded(
            flex: 5,
            child: GestureDetector(
              onTap: () {
                // ? Next status logic or else exit
              },
              child: Container(),
            ),
          )
        ],
      ),
    );
  }
}
