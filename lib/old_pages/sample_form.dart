import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import '../util/alerts.dart';

class SampleForm extends StatefulWidget {
  final String? path;
  const SampleForm({Key? key, this.path}) : super(key: key);

  @override
  State<SampleForm> createState() => _SampleFormState();
}

class _SampleFormState extends State<SampleForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: const Center(child: Text('Sample Form')),
        actions: [
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.language, color: Colors.blue.withOpacity(0))
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: PDFView(
            filePath: widget.path,
            onError: (error) {
              alert(context: context, title: "Error: ${error.toString()}", message: const Text('Please try again'));
            },
            autoSpacing: false,
          ),
        ),
      ),
    );
  }
}

