import 'package:flutter/material.dart';

class MyStarBucksFixAppBarWidget extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  const MyStarBucksFixAppBarWidget({
    required this.expandedHeight,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          'assets/images/starbucks/00_01_snow.png',
          fit: BoxFit.cover,
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black.withOpacity(0.5),
              ],
            ),
          ),
        ),
        Positioned(
          child: AppBar(
            title: const Text(
              '올해 크리스마스도 역시, 스타벅스 케이크와 함께!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
      ],
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
