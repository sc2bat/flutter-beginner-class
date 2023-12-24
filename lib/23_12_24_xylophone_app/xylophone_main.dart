import 'package:flutter/material.dart';

import 'screen/my_xylophone_home_page_screen.dart';

void main() {
  runApp(MyXylophoneApp());
}

class MyXylophoneApp extends StatelessWidget {
  const MyXylophoneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'my xylophone app',
      home: MyXylophoneHomePageScreen(),
    );
  }
}
