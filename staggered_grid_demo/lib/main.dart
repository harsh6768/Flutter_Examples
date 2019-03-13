import 'package:flutter/material.dart';
import 'package:staggered_grid_demo/dash_board.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: DashBoard(),
      ),
    );
  }
}
