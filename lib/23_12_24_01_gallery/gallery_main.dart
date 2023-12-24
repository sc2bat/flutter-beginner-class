import 'package:flutter/material.dart';

import 'screen/my_gallery_home_page_screen.dart';

void main() {
  runApp(const MyGalleryApp());
}

class MyGalleryApp extends StatelessWidget {
  const MyGalleryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'my gallery app',
      home: MyGalleryHomePageScreen(),
    );
  }
}
