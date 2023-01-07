import 'package:flutter/material.dart';
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
  @override
  void initState() {
    super.initState();
    fromAsset('assets/PDFs/SamplePatientIntakeForm-$language.pdf', 'SamplePatientIntakeForm-$language.pdf').then((f) {
      setState(() {
        sampleFormPath = f.path;
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
            const Expanded(child: SizedBox()),
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
                if (sampleFormPath.isNotEmpty) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SampleForm(path: sampleFormPath,)));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
