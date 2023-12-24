import 'package:flutter/material.dart';

class MyHorizontalMainPageScreen extends StatefulWidget {
  const MyHorizontalMainPageScreen({super.key});

  @override
  State<MyHorizontalMainPageScreen> createState() =>
      _MyHorizontalMainPageScreenState();
}

class _MyHorizontalMainPageScreenState
    extends State<MyHorizontalMainPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'my horizontal app',
        ),
      ),
      body: Column(),
    );
  }
}
