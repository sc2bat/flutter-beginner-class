import 'package:flutter/material.dart';

import 'screen/check_box_screen.dart';

void main() {
  runApp(const MyCheckBoxApp());
}

class MyCheckBoxApp extends StatelessWidget {
  const MyCheckBoxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'checkbox test',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        useMaterial3: true,
      ),
      home: const CheckBoxScreen(),
    );
  }
}
