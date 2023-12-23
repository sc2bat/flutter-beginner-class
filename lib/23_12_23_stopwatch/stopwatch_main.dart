import 'dart:async';

import 'package:flutter/material.dart';
import 'package:simple_logger/simple_logger.dart';

import 'screen/my_stopwatch_home_page_screen.dart';

void main() {
  final logger = SimpleLogger();
  Timer.periodic(Duration(seconds: 1), (timer) {
    // logger.info('timer testing');
  });

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
