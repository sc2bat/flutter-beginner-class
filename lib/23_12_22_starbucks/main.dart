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
            const SliverAppBar(
              pinned: true,
              floating: false,
              expandedHeight: 60.0,
              // backgroundColor: Colors.amber,
              title: Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.mail_outlined,
                          size: 30,
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          'What\'s New',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: 16.0,
                        ),
                        Icon(
                          Icons.movie_filter,
                          size: 30,
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          'Coupon',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.notifications_none,
                          size: 30,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // const SliverPersistentHeader(
            //   pinned: true,
            //   floating: false,
            //   delegate: MyStarBucksFixAppBarWidget(expandedHeight: 200.0),
            // ),
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
