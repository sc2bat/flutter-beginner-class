import 'package:flutter/material.dart';

import 'widget/my_web_view_widget.dart';

void main() {
  runApp(const TestWebViewApp());
}

class TestWebViewApp extends StatefulWidget {
  const TestWebViewApp({super.key});

  @override
  State<TestWebViewApp> createState() => _TestWebViewApp();
}

class _TestWebViewApp extends State<TestWebViewApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'webview 4.0',
      home: MyWebViewWidget(),
    );
  }
}
