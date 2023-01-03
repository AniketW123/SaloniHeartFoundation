import 'package:flutter/material.dart';
import 'package:saloni_heart_foundation/pages/information_web_view.dart';
import 'package:saloni_heart_foundation/util/listtiles.dart';

class InformationPage extends StatefulWidget {
  const InformationPage({Key? key}) : super(key: key);

  @override
  State<InformationPage> createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  TextStyle informationStyle = const TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white,);
  final double spacing = 3;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ImageListTile(
          image: 'assets/images/InfoImage1.jpg',
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => InformationWebView(page: 'copy-of-how-does-a-normal-heart-work-1')));
          },
          body: Text(' General Information on\nCongenital Heart Defects', style: informationStyle),
        ),
        ImageListTile(
          padding: EdgeInsets.only(top: spacing),
          image: 'assets/images/InfoImage1.jpg',
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => InformationWebView(page: 'copy-of-general-information-on-congen')));
          },
          body: Text('Common Acyanotic Congenital\nHeart Defects and Treatment', style: informationStyle),
        ),
        ImageListTile(
          padding: EdgeInsets.only(top: spacing),
          image: 'assets/images/InfoImage3.jpg',
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => InformationWebView(page: 'copy-of-common-acyanotic-congenital-h')));
          },
          body: Text('Common Cyanotic Congenital\nHeart Defects and Treatment', style: informationStyle),
        ),
        ImageListTile(
          padding: EdgeInsets.only(top: spacing),
          image: 'assets/images/InfoImage1.jpg',
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => InformationWebView(page: 'copy-of-common-cyanotic-congenital-he')));
          },
          body: Text('Procedures Done in\na Catheterization Lab', style: informationStyle),
        ),
        ImageListTile(
          padding: EdgeInsets.only(top: spacing),
          image: 'assets/images/InfoImage5.jpg',
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => InformationWebView(page: 'copy-of-procedures-done-in-a-catheter')));
          },
          body: Text('Surgical Procedures', style: informationStyle),
        ),
      ],
    );
  }
}
