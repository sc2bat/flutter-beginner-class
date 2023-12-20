// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

import 'model/star.dart';
import 'widget/star_widget.dart';

void main() {
  runApp(MyStarApp());
}

class MyStarApp extends StatelessWidget {
  const MyStarApp({super.key});

  final String _test = '속삭이는 몽자';
  final String _imageUrl =
      'https://i.namu.wiki/i/44PjLeJaD8ycDCsibi4Mc4pX_5hY1QuhWHNvA9hC4OpXxpPFEBHz8GrSCeMhWYFER4zkElbcYYfCIIrqBKKQhHYEBdNxt-i_RscoD7z2HxgPf4G6Mcz6siFhbxXKrZdFk5fKVUf_2zWG4azmj_PVWg.webp';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _test,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xffcd853f),
        ),
        useMaterial3: true,
      ),
      home: StarWidget(
        star: Star(
            id: 1,
            dogBread: '푸들',
            gender: 'female',
            birthDay: DateTime(2016, 4, 8),
            channelName: _test,
            imageUrl: _imageUrl),
      ),
    );
  }
}
