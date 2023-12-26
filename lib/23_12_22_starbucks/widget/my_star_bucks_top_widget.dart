import 'package:flutter/material.dart';

class MyStarBucksTopWidget extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  static const double maxValue = 5.0;

  const MyStarBucksTopWidget({
    required this.expandedHeight,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    double currentValue = 2.0;
    double progressValue = currentValue / maxValue;
    int goalValue = (maxValue - currentValue).floor();

    return Column(
      children: [
        Expanded(
          child: Stack(
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
                    margin: const EdgeInsets.only(bottom: 10.0),
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
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 프로그래스 바와 두 번째 텍스트 간격 조절
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$goalValue ☆ until Green Level',
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black26,
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: LinearProgressIndicator(
                              value: progressValue,
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                Colors.lightGreenAccent,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 16.0,
                  ),
                  Text(
                    '${currentValue.floor()}',
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    ' /${maxValue.floor()} ☆',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black26,
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight + 30;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
