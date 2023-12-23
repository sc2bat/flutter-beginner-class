import 'package:flutter/material.dart';

void main() {
  runApp(const TestApp());
}

class TestApp extends StatefulWidget {
  const TestApp({super.key});

  @override
  State<TestApp> createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'test webview 4.0',
      home: Scaffold(),
    );
  }
}
