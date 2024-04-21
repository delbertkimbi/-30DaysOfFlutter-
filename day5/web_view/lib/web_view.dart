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
    ..loadRequest(Uri.parse('https://cforeveryone-1c553-79a37.web.app'));
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: WebViewWidget(controller: controller),
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
