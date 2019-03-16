import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:timedim/login.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    //enable the full screen
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 5,
      navigateAfterSeconds: LoginPage(),
      title: new Text(
        'Welcome In Weedon',
        style: new TextStyle(
            fontWeight: FontWeight.bold, fontSize: 30.0, color: Colors.white),
      ),
      image: Image.asset('images/pica2.png'),
      gradientBackground: new LinearGradient(
          colors: [Colors.cyan, Colors.blue],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight),
      backgroundColor: Colors.white,
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 100.0,
      loaderColor: Colors.yellow,
    );
  }
}
