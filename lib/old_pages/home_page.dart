import 'package:flutter/material.dart';
import '../util/listtiles.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextStyle missionStyle = const TextStyle(fontSize: 15, color: Colors.white);
  TextStyle missionStyleBold = const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        // image: DecorationImage(image: AssetImage('assets/images/HomeBackground.jpg'), fit: BoxFit.cover),
      ),
      child: ListView(
        children: [
          RoundedListTile(
            title: 'Our Mission',
            color: Colors.blue.shade900,
            body: RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: '• Patient Consultation: ', style: missionStyleBold),
                  TextSpan(text: 'Provide free unbiased consultation from the world\'s top doctors to families of children with complex heart condition.\n', style: missionStyle),
                  TextSpan(text: '\n• Doctor Training: ', style: missionStyleBold),
                  TextSpan(text: 'Enable doctors from India to learn skills from the world\'s best pediatric cardio-thoracic surgeons and cardiologists so that children living in India can get the best care.\n', style: missionStyle),
                  TextSpan(text: '\n• Medical Education: ', style: missionStyleBold),
                  TextSpan(text: 'Provide scholarships to deserving scholars from economically weaker sections in India, for education in the field of medicine & science.', style: missionStyle),
                ]
              ),
            ),
          ),
        ],
      ),
    );
  }
}
