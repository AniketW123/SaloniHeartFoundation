import 'package:flutter/material.dart';
import '../util/listtile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextStyle missionStyle = TextStyle(fontSize: 15, color: Colors.white);
  TextStyle missionStyleBold = TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        RoundedListTile(
          title: 'Our Mission',
          color: Colors.blue.shade900,
          body: RichText(
            text: TextSpan(
              children: [
                TextSpan(text: '• Patient Consultation: ', style: missionStyleBold),
                TextSpan(text: 'Provide free unbiased consultation from the world\'s Top doctors to families of children with complex heart condition.\n', style: missionStyle),
                TextSpan(text: '• Doctor Training: ', style: missionStyleBold),
                TextSpan(text: 'Provide free unbiased consultation from the world\'s Top doctors to families of children with complex heart condition.\n', style: missionStyle),
                TextSpan(text: '• Patient Consultation: ', style: missionStyleBold),
                TextSpan(text: 'Provide free unbiased consultation from the world\'s Top doctors to families of children with complex heart condition.\n', style: missionStyle),
              ]
            ),
          ),
        )
      ],
    );
  }
}
