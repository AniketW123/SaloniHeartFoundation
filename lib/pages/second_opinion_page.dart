import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import '../main.dart';
import '../pages/patient_intake_form.dart';
import '../pages/sample_form.dart';
import '../util/buttons.dart';
import '../util/listtiles.dart';

class SecondOpinionPage extends StatefulWidget {
  const SecondOpinionPage({Key? key}) : super(key: key);

  @override
  State<SecondOpinionPage> createState() => _SecondOpinionPageState();
}

class _SecondOpinionPageState extends State<SecondOpinionPage> {
  String path = '';
  Future<File> fromAsset(String asset, String filename) async {
    Completer<File> completer = Completer();
    try {
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/$filename");
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint8List();
      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }
    return completer.future;
  }

  void initState() {
    super.initState();
    fromAsset('assets/PDFs/SamplePatientIntakeForm-$language.pdf', 'SamplePatientIntakeForm-$language.pdf').then((f) {
      setState(() {
        path = f.path;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return RoundedListTile(
      color: Colors.blue.shade900,
      body: Expanded(
        child: Column(
          children: [
            const Text(
              '''To start the process of getting a second opinion, please fill 'Patient Intake Form’ through the link given below. Once we receive all necessary medical information about your child, we shall contact our doctors for a second opinion. Please let us know if you have any concerns or questions. Saloni Heart Foundation (SHF)  fully respects patient privacy. SHF will not sell or share the patient’s personal information with anyone except consulting doctors and medical personnel.''',
              textAlign: TextAlign.justify,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Expanded(child: SizedBox()),
            RoundedButton(
              text: 'Patient Intake Form',
              color: Colors.pinkAccent,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const PatientIntakeForm()));
              },
            ),
            RoundedButton(
              text: 'Sample Form',
              color: Colors.pinkAccent,
              onPressed: () {
                print(path);
                if (path.isNotEmpty) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SampleForm(path: path,)));
                }

              },
            ),
          ],
        ),
      ),
    );
  }
}
