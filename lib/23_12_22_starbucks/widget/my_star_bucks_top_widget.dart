import 'package:flutter/material.dart';

class MyStarBucksTopWidget extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  const MyStarBucksTopWidget({
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 260.0,
              child: const Text(
                '올해 크리스마스도 역시, 스타벅스 케이크와 함께!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.visible,
                maxLines: 2,
              ),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '내용 보기',
                style: TextStyle(
                  color: Colors.black45,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Icon(
                Icons.arrow_right_alt_outlined,
                color: Colors.black54,
                size: 24,
              ),
            ],
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
