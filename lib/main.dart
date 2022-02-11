import 'package:flutter/material.dart';
import 'Widgets/MyNavigationBar.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp() : super();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyNavigationBar(),
    );
  }
}
