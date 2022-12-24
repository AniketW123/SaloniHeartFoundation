import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:saloni_heart_foundation/pages/contact_page.dart';
import 'package:saloni_heart_foundation/pages/donate_page.dart';
import 'package:saloni_heart_foundation/pages/information_page.dart';
import 'pages/home_page.dart';

void main() {
  runApp(MaterialApp(
    title: 'Saloni Heart Foundation',
    theme: ThemeData(
      primarySwatch: Colors.pink,
      canvasColor: Colors.blue.shade900,
    ),
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedIndex = 0;
  List<Widget> pages = <Widget> [HomePage(), InformationPage(), ContactPage(), DonatePage()];
  List<String> titles = <String> ['Home', 'Information', 'Contact', 'Donate'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO: add language option
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Center(child: Text(titles.elementAt(selectedIndex))),
        actions: [
          IconButton(
            onPressed: () {
              
            },
            icon: const Icon(Icons.language)
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue.shade800,
        selectedItemColor: Colors.pinkAccent,
        showUnselectedLabels: true,
        currentIndex: selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: "Information",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_support),
            label: "Contact",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.heart_fill),
            label: "Donate",
          ),
        ],
        onTap: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
      body: SafeArea(
        child: Center(
          child: pages.elementAt(selectedIndex),
        ),
      ),
    );
  }
}
