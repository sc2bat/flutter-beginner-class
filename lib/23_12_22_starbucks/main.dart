import 'package:flutter/material.dart';

import 'widget/banner_title_widget.dart';
import 'widget/my_star_bucks_fix_app_bar_widget.dart';
import 'widget/my_star_bucks_fix_app_bar_widget_bak.dart';
import 'widget/my_star_bucks_top_widget.dart';

void main() {
  runApp(const MyStarBucksApp());
}

class MyStarBucksApp extends StatelessWidget {
  const MyStarBucksApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            const SliverPersistentHeader(
              pinned: false,
              floating: false,
              delegate: MyStarBucksTopWidget(expandedHeight: 270.0),
            ),
            const MyStarBuckFixAppBarWidget(),
            const BannerTitleWidget(
                title: 'Quick Order',
                titleColor: Colors.black,
                description: '최근 주문',
                descriptionColor: Colors.black),
            SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.teal[100 * (index % 9)],
                  child: Text('etate'),
                );
              }, childCount: 20),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200.0,
              ),
            ),
            const BannerTitleWidget(
                title: 'What\'s New',
                titleColor: Colors.black,
                description: 'See all',
                descriptionColor: Colors.lightGreen),
            SliverToBoxAdapter(
              child: Container(
                height: 150.0, // 가로로 스크롤할 카드 리스트의 높이 설정
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10, // 카드 리스트의 아이템 개수 설정
                  itemBuilder: (context, index) {
                    return Card(
                      // 카드의 디자인 및 내용 설정
                      child: Container(
                        width: 150.0, // 카드의 가로 길이 설정
                        child: Center(
                          child: Text('Card $index'),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
