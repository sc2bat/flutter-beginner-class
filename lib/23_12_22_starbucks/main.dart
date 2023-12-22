import 'package:flutter/material.dart';

import 'widget/my_star_bucks_fix_app_bar_widget.dart';
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
              delegate: MyStarBucksTopWidget(expandedHeight: 200.0),
            ),
            const SliverPersistentHeader(
              pinned: true,
              floating: false,
              delegate: MyStarBucksFixAppBarWidget(expandedHeight: 200.0),
            ),
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
          ],
        ),
      ),
    );
  }
}
