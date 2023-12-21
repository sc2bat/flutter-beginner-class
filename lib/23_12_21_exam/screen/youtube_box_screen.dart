import 'package:flutter/material.dart';

class YoutubeBoxScreen extends StatelessWidget {
  const YoutubeBoxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final listA = [
      '전체',
      '게임',
      '뉴스',
      '음악',
      '실시간',
      '수학',
      '액션 어드벤처 게임',
      '요리',
      '축구',
      '최근에 업로드된 동영상',
      '새로운 맞춤 동영상',
    ];

    return Scaffold(
      body: Column(
        children: [
          Image.file(file),
        ],
      ),
    );
  }
}
