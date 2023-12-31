import 'package:flutter/material.dart';
import 'package:flutter_beginer_class/23_12_26_bmi_calculator/route/routes.dart';
import 'package:simple_logger/simple_logger.dart';

final logger = SimpleLogger();

void main() {
  runApp(const MyBmiGoRoute());
}

class MyBmiGoRoute extends StatelessWidget {
  const MyBmiGoRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'bmi calc',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
