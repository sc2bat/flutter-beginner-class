// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_beginer_class/23_12_21_exam/repository/user_repository.dart';
import 'package:flutter_beginer_class/23_12_21_exam/repository/video_repository.dart';

import '../repository/category_repository.dart';
import '../widget/bottom_navigator_widget.dart';
import '../widget/category_widget.dart';
import '../widget/topbar_widget.dart';
import '../widget/video_list_widget.dart';

class YoutubeBoxScreen extends StatelessWidget {
  const YoutubeBoxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userInfo = UserRepository().getUser();

    final categories = CategoryRepository().getCategories();

    final youtubeVideos = VideoRepository()
        .getVideos()
        .where((element) => element.kind == 'video')
        .toList();
    final youtubeShorts = VideoRepository()
        .getVideos()
        .where((element) => element.kind == 'short')
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'youtube ui clone',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black87,
        toolbarHeight: 30.0,
      ),
      body: Container(
        color: Colors.black87,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TopbarWidget(userInfo: userInfo),
              CategoryWidget(categories: categories),
              Expanded(
                child: VideoListWidget(
                  videos: youtubeVideos,
                  shorts: youtubeShorts,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavigatorWidget(),
    );
  }
}
