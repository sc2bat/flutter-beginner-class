import 'package:flutter/material.dart';
import 'package:flutter_beginer_class/23_12_22_bmi_calculator/result_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _formKey = GlobalKey<FormState>();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  @override
  void dispose() {
    save();
    _heightController.dispose();
    _weightController.dispose();

    super.dispose();
  }

  Future save() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('height', double.parse(_heightController.text));
    await prefs.setDouble('weight', double.parse(_weightController.text));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('bmi calculator'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextFormField(
              controller: _heightController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'height',
              ),
              keyboardType: TextInputType.number,
              validator: (value) =>
                  value == null || value.isEmpty ? 'height is empty' : null,
            ),
            const SizedBox(
              height: 8.0,
            ),
            TextFormField(
              controller: _weightController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'weight',
              ),
              keyboardType: TextInputType.number,
              validator: (value) =>
                  value == null || value.isEmpty ? 'weight is empty' : null,
            ),
            const SizedBox(
              height: 8.0,
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState?.validate() == false) {
                  return;
                }

                final height = double.parse(_heightController.text);
                final weight = double.parse(_weightController.text);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ResultScreen(height: height, weight: weight),
                  ),
                );
              },
              child: const Text('result'),
            )
          ],
        ),
      ),
    );
  }
}
