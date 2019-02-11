import 'package:flutter/material.dart';
import 'package:flutter_firebase/landing.dart';


void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: LandingPage(),
    );
  }
}