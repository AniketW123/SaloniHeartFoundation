import 'package:flutter/material.dart';
import 'package:saloni_heart_foundation/util/listtiles.dart';

class FAQPage extends StatefulWidget {
  const FAQPage({Key? key}) : super(key: key);

  @override
  State<FAQPage> createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {

  Map<String, String> questions = {'q1':'a1', 'q2':'a2'};
  List<Widget> FAQListTiles = [const CircularProgressIndicator()];

  @override
  void initState() {
    super.initState();
    questions.forEach((key, value) {
      FAQListTiles.add(
        Card(
          margin: const EdgeInsets.all(10),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
          clipBehavior: Clip.antiAlias,
          child: ExpansionTile(
            title: Text(key),
            collapsedBackgroundColor: Colors.white,
            backgroundColor: Colors.white,
            textColor: Colors.black,
            iconColor: Colors.grey.shade600,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(17, 5, 17, 15),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(value, textAlign: TextAlign.left,)
                ),
              )
            ],
          ),
        )
      );
    });
    FAQListTiles.removeAt(0);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: FAQListTiles
    );
  }
}
