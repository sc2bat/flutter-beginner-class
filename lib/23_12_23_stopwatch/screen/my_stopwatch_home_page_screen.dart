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

  final List<String> _lapTimes = [];

  void _clickButton() {
    _isRunning = !_isRunning;
    _isRunning ? _start() : _pause();
  }

  void _start() {
    _timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
      setState(() {
        _time++;
      });
    });
  }

  void _pause() {
    setState(() {
      _timer?.cancel();
    });
  }

  void _reset() {
    _isRunning = false;
    _timer?.cancel();
    _lapTimes.clear();
    _time = 0;
  }

  void _recordLapTime(String time) {
    _lapTimes.insert(0, '${_lapTimes.length + 1} 등 $time');
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    int currentSeconds = _time ~/ 100;
    String currentMilliseconds = '${_time % 100}'.padLeft(2, '0');

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
                '$currentSeconds',
                style: const TextStyle(
                  fontSize: 50,
                ),
              ),
              Text(
                currentMilliseconds,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 100.0,
            height: 200.0,
            child: ListView(
              children: _lapTimes.map((e) => Center(child: Text(e))).toList(),
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    _reset();
                  });
                },
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
                onPressed: () {
                  setState(() {
                    _recordLapTime('$currentSeconds.$currentMilliseconds');
                  });
                },
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
