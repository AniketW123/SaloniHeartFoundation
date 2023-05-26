import 'package:flutter/material.dart';
import '../util/listtiles.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: double.infinity,
          child: RoundedListTile(
            color: Colors.blue.shade900,
            title: 'Any questions?',
            body: const Text(
              'Email: admin@saloniheartfoundation.org\nCall/WhatsApp USA: +1 650 770 5000\nCall/WhatsApp India: +91 98187 33060',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16
              ),
            ),
          ),
        ),
      ]
    );
  }
}
