import 'package:flutter/material.dart';
import 'package:flutter_beginer_class/23_12_26_bmi_calculator/screen/main_screen.dart';

void main() {
  runApp(const MyBmiGoRoute());
}

class MyBmiGoRoute extends StatelessWidget {
  const MyBmiGoRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'bmi calc',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainScreen(),
    );
  }
}
