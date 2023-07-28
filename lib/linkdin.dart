import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'dashboard.dart';
class Linkdin extends StatelessWidget {

  late var controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith(
              'https://www.collegedoors.com/pages/index.php')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(Uri.parse('https://in.linkedin.com/school/collegedoors/'));

  // Webapp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Web View',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Collegedoors Linkdin Profile'),
          leading: BackButton(
            color: Colors.white,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {return const Dashboard();}),);
            },// <-- SEE HERE
          ),
          centerTitle: true,
        ),
        body: WebViewWidget(controller: controller),

      ),
    );
  }
}