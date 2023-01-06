import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'pages/home_page.dart';
import 'pages/parent_portal_page.dart';
import 'pages/second_opinion_page.dart';
import 'pages/about_page.dart';
import '../util/alerts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MaterialApp(
    title: 'Saloni Heart Foundation',
    home: MyApp(),
  ));
}

String language = 'EN';
String languageDropdownValue = 'EN';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedIndex = 0;
  List<Widget> pages = [const HomePage(), const ParentPortalPage(), const SecondOpinionPage(), const DonatePage()];
  List<String> titles = ['Home', 'Parent Portal', 'Second Opinion', 'About Us'];

  void chooseLanguage () async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('chosen_language') != true) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) => StatefulBuilder(
              builder: (context, setState) {
                return AlertDialog(
                  title: const Text('Choose Your Language / अपनी भाषा चुनें'),
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
                          prefs.setBool('language_chosen', true);
                          Navigator.pop(context);
                        }
                    ),
                  ],
                );
              }
          )
      );
    }
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    chooseLanguage();
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
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: titles.elementAt(0),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.info),
            label: titles.elementAt(1),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.contact_support),
            label: titles.elementAt(2),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.people),
            label: titles.elementAt(3),
          ),
        ],
        onTap: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
      body: SafeArea(
        child: pages.elementAt(selectedIndex),
      ),
    );
  }
}
