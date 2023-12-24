import 'package:flutter/material.dart';

import 'screen/my_map_home_page_screen.dart';

void main() {
  runApp(const MyMapApp());
}

class MyMapApp extends StatelessWidget {
  const MyMapApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'my map app',
      home: MyMapHomePageScreen(),
    );
  }
}
