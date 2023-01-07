import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../util/alerts.dart';

class PatientIntakeForm extends StatefulWidget {
  const PatientIntakeForm({Key? key}) : super(key: key);

  @override
  State<PatientIntakeForm> createState() => _PatientIntakeFormState();
}

class _PatientIntakeFormState extends State<PatientIntakeForm> {
  late WebViewController controller;
  int progress = 0;

  @override
  void initState() {
    super.initState();
    controller = WebViewController();
    controller.setNavigationDelegate(NavigationDelegate(
      onNavigationRequest: (NavigationRequest request) {
        if (request.url.contains('https://docs.google.com/forms/')) {
          return NavigationDecision.navigate;
        }
        alert(context: context, title: 'An error occurred. Please try again');
        return NavigationDecision.prevent;
      },
      onProgress: (int p) {
        setState(() {
          progress = p;
        });
      }
    ));
    controller.setJavaScriptMode(JavaScriptMode.unrestricted);
    controller.loadRequest(Uri.parse('https://docs.google.com/forms/d/e/1FAIpQLSeEfJ5ovI6TGYhY6kL-o2DHN8dT1r5MpyPGFQ6JOaQAm1xaOQ/viewform?usp=sf_link'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: const Center(child: Text('Patient Intake Form')),
        actions: [
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.language, color: Colors.blue.withOpacity(0))
          ),
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            WebViewWidget(controller: controller),
            progress == 100 ? const SizedBox():
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                      width: 100,
                      height: 100,
                      child: CircularProgressIndicator(color: Colors.black, strokeWidth: 10,)
                  ),
                  const SizedBox(height: 10,),
                  Text('$progress%', style: const TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
