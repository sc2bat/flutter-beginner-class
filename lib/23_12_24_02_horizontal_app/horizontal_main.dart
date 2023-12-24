import 'package:flutter/material.dart';

import 'screen/my_horizontal_main_page_screen.dart';

void main() {
  runApp(const MyHorizontalApp());
}

class MyHorizontalApp extends StatelessWidget {
  const MyHorizontalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'my horizontal app',
      home: MyHorizontalMainPageScreen(),
    );
  }
}
