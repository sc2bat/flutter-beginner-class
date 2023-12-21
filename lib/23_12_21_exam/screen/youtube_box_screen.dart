// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_beginer_class/23_12_21_exam/repository/user_repository.dart';

import '../repository/category_repository.dart';
import '../widget/category_widget.dart';
import '../widget/topbar_widget.dart';
import 'youtube_dump_screen.dart';

class YoutubeBoxScreen extends StatelessWidget {
  const YoutubeBoxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userInfo = UserRepository().getUser();

    final categories = CategoryRepository().getCategories();

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
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const YoutubeDumpScreen(
                        tapId: 1,
                      ),
                      // fullscreenDialog: true,
                    ),
                  );
                },
                child: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    // TODO: Favorite 버튼을 눌렀을 때의 동작 정의
                    print('touched 3333');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 60.0,
        color: Colors.black87,
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                // TODO: Home 버튼을 눌렀을 때의 동작 정의
              },
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                // TODO: Search 버튼을 눌렀을 때의 동작 정의
              },
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const YoutubeDumpScreen(
                      tapId: 1,
                    ),
                    // fullscreenDialog: true,
                  ),
                );
              },
              child: IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  // TODO: Favorite 버튼을 눌렀을 때의 동작 정의
                  print('touched 3333');
                },
              ),
            ),
            IconButton(
              icon: Icon(Icons.subscriptions_outlined),
              onPressed: () {
                // TODO: Favorite 버튼을 눌렀을 때의 동작 정의
              },
            ),
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                // TODO: Person 버튼을 눌렀을 때의 동작 정의
              },
            ),
          ],
        ),
      ),
    );
  }
}
