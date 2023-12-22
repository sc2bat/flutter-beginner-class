import 'package:flutter/material.dart';

class MyStarBucksFixAppBarWidget extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  const MyStarBucksFixAppBarWidget({
    required this.expandedHeight,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    const levelPoint = 0;

    return SliverToBoxAdapter(
      child: Container(
        child: Row(
          children: [
            Row(
              children: [
                Text('testt'),
              ],
            ),
            Row(
              children: [
                Text('testt'),
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
