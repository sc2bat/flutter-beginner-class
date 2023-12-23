import 'package:flutter/material.dart';

import 'screen/my_stopwatch_home_page_screen.dart';

void main() {
  runApp(const MyStopWatchApp());
}

class MyStopWatchApp extends StatelessWidget {
  const MyStopWatchApp({super.key});

  @override
  Widget build(Object context) {
    return MaterialApp(
      title: 'my stopwatch app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyStopwatchHomePageScreen(),
    );
  }
}
