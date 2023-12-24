import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sensors_plus/sensors_plus.dart';
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
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    const containerWidth = 50.0;
    const containerHeight = 50.0;

    final centerX = MediaQuery.of(context).size.width / 2 - containerWidth / 2;
    final centerY =
        MediaQuery.of(context).size.height / 2 - containerHeight / 2;

    // logger.info('qwerasdf centerX, $centerX');
    // logger.info('qwerasdf centerY, $centerY');

    return Scaffold(
      body: Stack(
        children: [
          StreamBuilder<AccelerometerEvent>(
              stream: accelerometerEventStream(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                // logger.info('qwerasdf $snapshot');

                final event = snapshot.data!;
                List<double> accelerometerValues = [
                  event.x,
                  event.y,
                  event.z,
                ];
                logger
                    .info('qwerasdf accelerometerValues $accelerometerValues');

                return Positioned(
                  left: centerX + accelerometerValues[1] * 15,
                  top: centerY + accelerometerValues[0] * 15,
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                    width: containerWidth,
                    height: containerHeight,
                  ),
                );
              }),
        ],
      ),
    );
  }
}
