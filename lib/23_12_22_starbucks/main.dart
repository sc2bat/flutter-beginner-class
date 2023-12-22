import 'package:flutter/material.dart';

import 'widget/banner_title_widget.dart';
import 'widget/bottom_navigation_bar_widget.dart';
import 'widget/my_star_bucks_fix_app_bar_widget.dart';
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
            cardOnlyBoxWidget(imageUrl: '03_01_chrismas_event.png'),
            cardOnlyBoxWidget(imageUrl: '05_01_card.png'),
            cardOnlyBoxWidget(imageUrl: '05_02_card.png'),
            const BannerTitleWidget(
                title: 'What\'s New',
                titleColor: Colors.black,
                description: 'See all',
                descriptionColor: Colors.lightGreen),
            const NewsCardListWidget(),
            cardOnlyBoxWidget(imageUrl: '06_01_card.png'),
            cardOnlyBoxWidget(imageUrl: '06_02_card.png'),
            cardOnlyBoxWidget(imageUrl: '06_03_card.png'),
            cardOnlyBoxWidget(imageUrl: '06_04_card.png'),
            cardOnlyBoxWidget(imageUrl: '06_05_card.png'),
          ],
        ),
        bottomNavigationBar: const BottomNavigationBarWidget(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print('order');
          },
          backgroundColor: Colors.lightGreen,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: const Icon(
            Icons.motorcycle_outlined,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter cardOnlyBoxWidget({required String imageUrl}) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.6),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(2, 2),
            )
          ]),
          child: Image.asset('assets/images/starbucks/$imageUrl'),
        ),
      ),
    );
  }
}
