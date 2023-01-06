import 'package:flutter/material.dart';
import '../main.dart';
import '../util/alerts.dart';

class PatientIntakeForm extends StatefulWidget {
  const PatientIntakeForm({Key? key}) : super(key: key);

  @override
  State<PatientIntakeForm> createState() => _PatientIntakeFormState();
}

class _PatientIntakeFormState extends State<PatientIntakeForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        leading: Padding(
          padding: const EdgeInsets.all(5),
          child: Image.asset('assets/images/SaloniHeartFoundationLogo.png'),
        ),
        title: Center(child: Text('Patient Intake Form')),
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
    );
  }
}
