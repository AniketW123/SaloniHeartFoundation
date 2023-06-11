import 'package:flutter/material.dart';

class FAQPage extends StatefulWidget {
  final int language;

  const FAQPage({Key? key, required this.language}) : super(key: key);

  @override
  State<FAQPage> createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
  Map<String, String> FAQsEN = {'Question 1 English?':'Answer', 'Question 2 English?':'Answer'};
  Map<String, String> FAQsHI = {'Question 1 Hindi?':'Answer', 'Question 2 Hindi?':'Answer'};
  late List<Map<String,String>> FAQs = [FAQsEN, FAQsHI];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [for (var key in FAQs[widget.language].keys) Card(
        margin: const EdgeInsets.all(10),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
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
                  child: Text(FAQs[widget.language][key] ?? '', textAlign: TextAlign.left,)
              ),
            )
          ],
        ),
      )]
    );
  }
}