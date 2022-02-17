import 'package:flutter/material.dart';
import 'Widgets/AFL.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp() : super();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AFL(),
    );
  }

  //   @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(initialRoute: '/AFL', routes: {
  //     '/AFL': (context) => const AFL(),
  //   });
  // }
}
