import 'package:flutter/material.dart';

class MyStarBucksFixAppBarWidget extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  const MyStarBucksFixAppBarWidget({
    required this.expandedHeight,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    const notificationCount = 0;

    return SliverAppBar(
      pinned: true,
      floating: false,
      expandedHeight: 60.0,
      // backgroundColor: Colors.amber,
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
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
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    const Icon(
                      Icons.notifications_none,
                      size: 30,
                    ),
                    if (notificationCount > 0)
                      Container(
                        padding: const EdgeInsets.all(2.0),
                        decoration: BoxDecoration(
                          color: Colors.lightGreen,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 16.0,
                          minHeight: 16.0,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
