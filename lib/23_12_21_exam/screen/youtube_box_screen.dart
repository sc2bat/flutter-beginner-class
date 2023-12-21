import 'package:flutter/material.dart';
import 'package:flutter_beginer_class/23_12_21_exam/repository/user_repository.dart';

import '../model/youtube_user.dart';

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

    final userInfo = UserRepository().getUser();

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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/youtube/icon-youtube-red-256.png',
                          width: 30.0,
                          height: 30.0,
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        const Text(
                          'YouTube',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'D2Coding',
                            letterSpacing: -3.0,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 30,
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        Stack(
                          alignment: Alignment.topRight,
                          children: [
                            const Icon(
                              Icons.notifications_none_outlined,
                              color: Colors.white,
                              size: 30,
                            ),
                            if (userInfo.alertCount > 0)
                              Container(
                                padding: const EdgeInsets.all(2.0),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                constraints: const BoxConstraints(
                                  minWidth: 16.0,
                                  minHeight: 16.0,
                                ),
                                child: Text(
                                  userInfo.alertCount > 9
                                      ? '9+'
                                      : '${userInfo.alertCount}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(
                          width: 16.0,
                        ),
                        const Icon(
                          Icons.connected_tv,
                          color: Colors.white,
                          size: 30,
                        ),
                        const SizedBox(
                          width: 16.0,
                        ),
                        ClipOval(
                          child: Image.network(
                            userInfo.userPhoto,
                            width: 30.0,
                            height: 30.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
