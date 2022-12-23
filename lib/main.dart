import 'package:flutter/material.dart';
import 'pages/home.dart';

void main() {
  runApp(MaterialApp(
    title: 'Saloni Heart Foundation',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: Home(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}