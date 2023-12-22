import 'package:flutter/material.dart';

import 'widget/banner_title_widget.dart';
import 'widget/my_star_bucks_fix_app_bar_widget.dart';
import 'widget/my_star_bucks_fix_app_bar_widget_bak.dart';
import 'widget/my_star_bucks_top_widget.dart';
import 'widget/news_card_list_widget.dart';
import 'widget/quick_order_card_list_widget.dart';

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
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset(
                    'assets/images/starbucks/01_01_2023_winter_e-frequency.png'),
              ),
            ),
            SliverToBoxAdapter(
              child:
                  Image.asset('assets/images/starbucks/02_01_siren_order.png'),
            ),
            const BannerTitleWidget(
                title: 'Quick Order',
                titleColor: Colors.black,
                description: '최근 주문',
                descriptionColor: Colors.black),
            const QuickOrderCardListWidget(),
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
            const NewsCardListWidget(),
          ],
        ),
      ),
    );
  }
}
