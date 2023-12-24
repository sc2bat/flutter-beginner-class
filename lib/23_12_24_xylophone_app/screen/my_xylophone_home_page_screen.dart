import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widget/piano_key_widget.dart';

class MyXylophoneHomePageScreen extends StatelessWidget {
  const MyXylophoneHomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.landscapeLeft,
      ],
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Xylophone App',
        ),
      ),
      body: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: XylophoneKeyBoard(keyName: '도', keyColor: Colors.red),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 24.0),
            child: XylophoneKeyBoard(keyName: '레', keyColor: Colors.orange),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 32.0),
            child: XylophoneKeyBoard(keyName: '미', keyColor: Colors.yellow),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 40.0),
            child: XylophoneKeyBoard(keyName: '파', keyColor: Colors.green),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 48.0),
            child: XylophoneKeyBoard(keyName: '솔', keyColor: Colors.blue),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 56.0),
            child: XylophoneKeyBoard(keyName: '라', keyColor: Colors.indigo),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 64.0),
            child: XylophoneKeyBoard(keyName: '시', keyColor: Colors.purple),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 72.0),
            child: XylophoneKeyBoard(keyName: '도', keyColor: Colors.red),
          ),
        ],
      ),
    );
  }
}
