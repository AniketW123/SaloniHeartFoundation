import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'pages/about_us_page.dart';
import 'pages/faq_page.dart';
import 'pages/videos_page.dart';
import 'pages/organizations_page.dart';
import 'pages/financial_aid_page.dart';
import '../util/alerts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MaterialApp(
    title: 'Saloni Heart Foundation',
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> languages = ['EN', 'HI'];
  late int language = 0;
  int languageDropdownValue = 0;

  int selectedIndex = 0;
  late List<Widget> pages = [const AboutUsPage(), FAQPage(language: language, key: ValueKey(language),), const VideosPage(), const FinancialAidPage()];
  List<String> titles = ['About Us', 'FAQs', 'Videos', 'Financial Aid'];

  void chooseLanguage (bool fromButton) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if ((prefs.getBool('chosen_language') != true || fromButton) && mounted) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => StatefulBuilder(
          builder: (context, builderSetState) {
            return AlertDialog(
              title: const Text('Choose Your Language / अपनी भाषा चुनें'),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              content: DropdownButton(
                items: [for(var i in languages) DropdownMenuItem(value: languages.indexOf(i), child: Text(i))],
                isExpanded: true,
                value: languageDropdownValue,
                onChanged: (value) {
                  if (value is int) {
                    builderSetState(() {
                      languageDropdownValue = value;
                    });
                  }
                },
              ),
              actions: [
                AlertButton(
                  title: 'OK',
                  onPressed: () {  //onChangeLanguage
                    setState(() {
                      language = languageDropdownValue;
                      pages = [const AboutUsPage(), FAQPage(language: language, key: ValueKey(language),), const VideosPage(), const OrganizationsPage(), const FinancialAidPage()];
                    });
                    prefs.setInt('language', language);
                    prefs.setBool('language_chosen', true);
                    Navigator.pop(context);
                  }
                ),
              ],
            );
          }
        )
      );
    } else if (!fromButton && mounted) {
      language = prefs.getInt('language') ?? 0;
    }
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    // chooseLanguage(false);
    //TODO: uncomment
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade200,
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
              chooseLanguage(true);
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
            icon: const Icon(Icons.people),
            label: titles.elementAt(0),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.question_mark),
            label: titles.elementAt(1),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.video_collection),
            label: titles.elementAt(2),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.home_work),
            label: titles.elementAt(3),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.monetization_on),
            label: titles.elementAt(4),
          ),
        ],
        onTap: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
      body: SafeArea(
        child: pages[selectedIndex],
      ),
    );
  }
}
