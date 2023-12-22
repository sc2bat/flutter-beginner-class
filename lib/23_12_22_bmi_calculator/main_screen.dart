import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('bmi calculator'),
      ),
      body: Form(
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'height',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(
              height: 8.0,
            ),
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'weight',
              ),
              keyboardType: TextInputType.number,
            ),
          ],
        ),
      ),
    );
  }
}
