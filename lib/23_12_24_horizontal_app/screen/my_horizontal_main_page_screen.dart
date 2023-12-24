import 'package:flutter/material.dart';
import 'package:simple_logger/simple_logger.dart';

final logger = SimpleLogger();

class MyHorizontalMainPageScreen extends StatefulWidget {
  const MyHorizontalMainPageScreen({super.key});

  @override
  State<MyHorizontalMainPageScreen> createState() =>
      _MyHorizontalMainPageScreenState();
}

class _MyHorizontalMainPageScreenState
    extends State<MyHorizontalMainPageScreen> {
  @override
  Widget build(BuildContext context) {
    const containerWidth = 50.0;
    const containerHeight = 50.0;

    final centerX = MediaQuery.of(context).size.width / 2 - containerWidth / 2;
    final centerY =
        MediaQuery.of(context).size.height / 2 - containerHeight / 2;

    logger.info('qwerasdf centerX, $centerX');
    logger.info('qwerasdf centerY, $centerY');

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: centerX,
            top: centerY,
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
              ),
              width: containerWidth,
              height: containerHeight,
            ),
          ),
        ],
      ),
    );
  }
}
