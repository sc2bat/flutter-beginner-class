import 'package:flutter/material.dart';

import 'screen/youtube_box_screen.dart';

void main() {
  runApp(const MyYoutubeApp());
}

class MyYoutubeApp extends StatelessWidget {
  const MyYoutubeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'uiclone youtube',
      home: YoutubeBoxScreen(),
    );
  }
}
