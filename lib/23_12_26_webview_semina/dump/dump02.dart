import 'package:flutter/material.dart';

void main() {
  runApp(const BrandNewWebViewApp());
}

class BrandNewWebViewApp extends StatefulWidget {
  const BrandNewWebViewApp({super.key});

  @override
  State<BrandNewWebViewApp> createState() => _BrandNewWebViewApp();
}

class _BrandNewWebViewApp extends State<BrandNewWebViewApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'my webview app',
      home: Scaffold(),
    );
  }
}
