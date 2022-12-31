import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:saloni_heart_foundation/pages/contact_page.dart';
import 'package:saloni_heart_foundation/pages/donate_page.dart';
import 'package:saloni_heart_foundation/pages/information_page.dart';
import 'package:saloni_heart_foundation/util/alerts.dart';
import 'pages/home_page.dart';

void main() {
  runApp(MaterialApp(
    title: 'Saloni Heart Foundation',
    theme: ThemeData(
      primarySwatch: Colors.pink,
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
  String language = 'EN';
  String languageDropdownValue = 'EN';

  int selectedIndex = 0;
  List<Widget> pages = [HomePage(), InformationPage(), ContactPage(), DonatePage()];
  List<String> titles = ['Home', 'Information', 'Contact', 'Donate'];

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO: add language option
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        leading: Padding(
          padding: const EdgeInsets.all(5),
          child: Image.asset('assets/images/SaloniHeartFoundationLogo.png'),
        ),
        title: Center(child: Text(titles.elementAt(selectedIndex))),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (_) => StatefulBuilder(
                      builder: (context, setState) {
                        return AlertDialog(
                          title: const Text('Change Language'),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          content: DropdownButton(
                            items: const [
                              DropdownMenuItem(value: 'EN', child: Text('EN'),),
                              DropdownMenuItem(value: 'HI', child: Text('HI'),),
                            ],
                            isExpanded: true,
                            value: languageDropdownValue,
                            onChanged: (value) {
                              if (value is String) {
                                setState(() {
                                  languageDropdownValue = value;
                                });
                              }
                            },
                          ),
                          actions: [
                              AlertButton(
                                  title: 'OK',
                                  onPressed: () {
                                    language = languageDropdownValue;
                                    Navigator.pop(context);
                                  }
                              ),
                              AlertButton(
                                title: 'Cancel',
                                onPressed: () {
                                  languageDropdownValue = language;
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                        );
                      }
                  )
              );
            },
            icon: const Icon(Icons.language)
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue.shade900,
        unselectedItemColor: Colors.white,
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
