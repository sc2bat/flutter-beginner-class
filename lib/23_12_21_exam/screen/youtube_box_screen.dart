// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_beginer_class/23_12_21_exam/repository/user_repository.dart';
import 'package:flutter_beginer_class/23_12_21_exam/repository/video_repository.dart';

import '../repository/category_repository.dart';
import '../widget/bottom_navigator_widget.dart';
import '../widget/category_widget.dart';
import '../widget/topbar_widget.dart';
import 'youtube_dump_screen.dart';

class YoutubeBoxScreen extends StatelessWidget {
  const YoutubeBoxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userInfo = UserRepository().getUser();

    final categories = CategoryRepository().getCategories();

    final youtubeVideos = VideoRepository().getVideos();
    Random random = Random();
    final videos = youtubeVideos
        .where((element) => element.kind == 'video')
        .toList()
      ..shuffle(random);

    String formatViewCount(int viewCount) {
      if (viewCount >= 100000000) {
        return '${(viewCount / 100000000).toStringAsFixed(0)}억회';
      } else if (viewCount >= 10000) {
        return '${(viewCount / 10000).toStringAsFixed(0)}만회';
      } else if (viewCount >= 1000) {
        return '${(viewCount / 1000).toStringAsFixed(0)}천회';
      } else {
        return '$viewCount 회';
      }
    }

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
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: videos.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Image.network(
                          videos[index].thumnail,
                          fit: BoxFit.cover,
                        ),
                        Row(
                          children: [
                            const CircleAvatar(
                              radius: 20,
                              backgroundImage: NetworkImage(
                                  'https://i.namu.wiki/i/cvGl4ZNRAlsZmBVZtVs_Iar9IuP42IExjHcEoc_Z2YdOx8M4ZsUleqFQJrNmQcNS87QpFbzNvti1GrmoGsNeR2z6SZyd25MCQM_9SirDrufw5KBFSalgTZQjH1VUf1LzJpsvF9t-0eQ9Xg9yh-lIfA.webp'),
                            ),
                            const SizedBox(
                              width: 8.0,
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      videos[index].title,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                    Row(
                                      children: [
                                        videos[index].uploadId.length > 20
                                            ? SizedBox(
                                                width: 200,
                                                child: Text(
                                                  videos[index].uploadId,
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.white54,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                ),
                                              )
                                            : Text(
                                                videos[index].uploadId,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.white54,
                                                ),
                                              ),
                                        const Text(
                                          ' · ',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white54,
                                          ),
                                        ),
                                        Text(
                                          formatViewCount(
                                              videos[index].viewCount),
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.white54,
                                          ),
                                        ),
                                        const Text(
                                          ' · ',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white54,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    );
                  },
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
