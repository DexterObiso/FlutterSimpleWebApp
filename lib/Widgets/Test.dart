import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({required Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => TestState();
}

class TestState extends State<Test> {
  Widget build(BuildContext context) {
    return Text('Hi');
  }

  void printSample() {
    print("Sample text");
  }
}
