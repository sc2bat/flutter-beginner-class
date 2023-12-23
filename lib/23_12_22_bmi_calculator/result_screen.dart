import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final double height;
  final double weight;

  const ResultScreen({
    super.key,
    required this.height,
    required this.weight,
  });

  String _bmiResultString(double bmi) {
    if (bmi >= 35) {
      return '고도 비만';
    } else if (bmi >= 30) {
      return '2단계 비만';
    } else if (bmi >= 25) {
      return '1단계 비만';
    } else if (bmi >= 23) {
      return '과체중';
    } else if (bmi >= 18.5) {
      return '정상';
    }
    return '저체중';
  }

  Widget _bmiResultIcon(double bmi) {
    if (bmi >= 23) {
      return const Icon(
        Icons.sentiment_very_dissatisfied,
        color: Colors.red,
        size: 100.0,
      );
    } else if (bmi >= 18.5) {
      return const Icon(
        Icons.sentiment_satisfied,
        color: Colors.green,
        size: 100.0,
      );
    }
    return const Icon(
      Icons.sentiment_dissatisfied,
      color: Colors.blue,
      size: 100.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    final bmi = weight / ((height / 100.0) * (height / 100.0));
    return Scaffold(
      appBar: AppBar(
        title: const Text('result screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _bmiResultString(bmi),
              style: const TextStyle(
                fontSize: 36,
              ),
            ),
            _bmiResultIcon(bmi),
          ],
        ),
      ),
    );
  }
}
