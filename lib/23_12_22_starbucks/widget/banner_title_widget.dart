import 'package:flutter/material.dart';

class BannerTitleWidget extends StatelessWidget {
  const BannerTitleWidget({
    super.key,
    required this.title,
    required this.titleColor,
    required this.description,
    required this.descriptionColor,
  });

  final String title;
  final Color titleColor;
  final String description;
  final Color descriptionColor;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 24.0,
                color: titleColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              description,
              style: TextStyle(
                fontSize: 18.0,
                color: descriptionColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
