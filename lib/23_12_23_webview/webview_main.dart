import 'package:flutter/material.dart';
import 'widget/my_web_view_widget.dart';

void main() {
  runApp(const MyWebViewApp());
}

class MyWebViewApp extends StatefulWidget {
  const MyWebViewApp({super.key});

  @override
  State<MyWebViewApp> createState() => _MyWebViewAppState();
}

class _MyWebViewAppState extends State<MyWebViewApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'my webview app',
      home: MyWebViewWidget(),
    );
  }
}
