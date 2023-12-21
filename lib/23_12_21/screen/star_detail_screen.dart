import 'package:flutter/material.dart';

import '../../23_12_20/model/star.dart';

class StarDetailScreen extends StatelessWidget {
  final Star star;

  const StarDetailScreen({
    super.key,
    required this.star,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Hero(
            tag: star.id,
            child: Image.network(star.imageUrl),
          ),
        ],
      ),
    );
  }
}
