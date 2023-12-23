import 'package:flutter/material.dart';

class MyStopwatchHomePageScreen extends StatefulWidget {
  const MyStopwatchHomePageScreen({super.key});

  @override
  State<MyStopwatchHomePageScreen> createState() =>
      _MyStopwatchHomePageScreenState();
}

class _MyStopwatchHomePageScreenState extends State<MyStopwatchHomePageScreen> {
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
                onPressed: () {},
                child: const Icon(
                  Icons.play_arrow,
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
