import 'dart:async';

import 'package:flutter/material.dart';

class MyStopwatchHomePageScreen extends StatefulWidget {
  const MyStopwatchHomePageScreen({super.key});

  @override
  State<MyStopwatchHomePageScreen> createState() =>
      _MyStopwatchHomePageScreenState();
}

class _MyStopwatchHomePageScreenState extends State<MyStopwatchHomePageScreen> {
  Timer? _timer;

  int _time = 0;

  bool _isRunning = false;

  List<String> _lapTimes = [];

  void _clickButton() {
    _isRunning = !_isRunning;
    _isRunning ? _start() : _pause();
  }

  void _start() {}
  void _pause() {}

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('my stopwatch app'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 32.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '0',
                style: const TextStyle(
                  fontSize: 50,
                ),
              ),
              Text(
                '00',
                style: const TextStyle(
                  fontSize: 30,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 100.0,
            height: 200.0,
            child: ListView(
              children: [
                Text('3300'),
                Text('3300'),
                Text('3300'),
                Text('3300'),
                Text('3300'),
                Text('3300'),
                Text('3300'),
                Text('3300'),
                Text('3300'),
                Text('3300'),
                Text('3300'),
                Text('3300'),
                Text('3300'),
                Text('3300'),
              ],
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                onPressed: () {},
                backgroundColor: Colors.orange,
                child: const Icon(
                  Icons.refresh,
                ),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    _clickButton();
                  });
                },
                child: Icon(
                  _isRunning ? Icons.pause : Icons.play_arrow,
                ),
              ),
              FloatingActionButton(
                onPressed: () {},
                backgroundColor: Colors.green,
                child: const Icon(
                  Icons.add,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 32.0,
          ),
        ],
      ),
    );
  }
}
