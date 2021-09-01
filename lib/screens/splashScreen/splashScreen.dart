import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    waitAndNavigateToMainScreen(context);
    return Scaffold(
      body: body(),
    );
  }

  Widget body() {
    return Center(
      child: Icon(
        Icons.chair,
        color: Colors.white,
      ),
    );
  }

  Future waitAndNavigateToMainScreen(BuildContext context) async {
    await Future.delayed(Duration(seconds: 2), () {
      context.vRouter.to('/home');
    });
  }
}
