import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({super.key});

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  final controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.disabled)
    ..loadRequest(Uri.parse('https://flutter.dev/'));
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: WebViewWidget(controller: controller),
        // bottomNavigationBar: Container(
        //   color: Colors.blue,
        //   child: Padding(
        //     padding: const EdgeInsets.only(bottom: 20, right: 20),
        //     child: ButtonBar(
        //       children: [
        //         navigationButton(Icons.arrow_back_ios_new_rounded, () {}),
        //         navigationButton(Icons.arrow_forward_ios_outlined, () {}),
        //       ],
        //     ),
        //   ),
        // ),
      ),
    );
  }

  Widget navigationButton(IconData icon, Function() onPressed) {
    return IconButton(
      icon: Icon(icon),
      onPressed: onPressed,
    );
  }
}
