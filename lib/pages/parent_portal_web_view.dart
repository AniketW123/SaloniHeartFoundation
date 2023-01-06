import 'package:flutter/material.dart';
import 'package:saloni_heart_foundation/util/alerts.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ParentPortalWebView extends StatefulWidget {
  final String page;
  const ParentPortalWebView({Key? key, required this.page}) : super(key: key);

  @override
  State<ParentPortalWebView> createState() => _ParentPortalWebViewState();
}

class _ParentPortalWebViewState extends State<ParentPortalWebView> {
  late String page = widget.page;
  late WebViewController controller;
  int progress = 0;

  @override
  void initState() {
    super.initState();
    page = widget.page;
    controller = WebViewController();
    controller.setNavigationDelegate(NavigationDelegate(
      onNavigationRequest: (NavigationRequest request) {
        if ((request.url).contains('https://www.parentportal.saloniheartfoundation.org/copy')) {
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
    controller.loadRequest(Uri.parse('https://www.parentportal.saloniheartfoundation.org/$page'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: const Center(child: Text('Parent Portal')),
        actions: [
          IconButton(
            onPressed: () {
              progress = 0;
              controller.loadRequest(Uri.parse('https://www.parentportal.saloniheartfoundation.org/$page'));
            },
            icon: const Icon(Icons.refresh)
          )
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            WebViewWidget(controller: controller),
            progress == 100 ? Column(
              children: [
                const Expanded(child: SizedBox()),
                Container(
                  alignment: AlignmentDirectional.bottomCenter,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height/10,
                  color: Colors.white,
                ),
              ],
            ):
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
