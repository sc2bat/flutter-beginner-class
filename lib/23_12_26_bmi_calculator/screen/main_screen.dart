import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_beginer_class/23_12_26_bmi_calculator/main.dart';
import 'package:flutter_beginer_class/23_12_26_bmi_calculator/model/person_info.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RouteMainScreen extends StatefulWidget {
  const RouteMainScreen({super.key});

  @override
  State<RouteMainScreen> createState() => _RouteMainScreenState();
}

class _RouteMainScreenState extends State<RouteMainScreen> {
  final _formKey = GlobalKey<FormState>();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  String selectedValue = '';

  String selectedGender = '남자';

  late int selectedYear = DateTime.now().year;
  late int selectedMonth = 1;
  late int selectedDay = 1;

  List<int> yearList =
      List.generate(60, (index) => DateTime.now().year - index);
  List<int> monthList = List.generate(12, (index) => index + 1);
  List<int> dayList = [];

  void updateDayList() {
    int maxDays = DateTime(selectedYear, selectedMonth + 1, 0).day;
    dayList = List.generate(maxDays, (index) => index + 1);

    if (selectedDay > maxDays) {
      setState(() {
        selectedDay = maxDays;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    updateDayList();
    load();
  }

  @override
  void dispose() {
    // save();
    _heightController.dispose();
    _weightController.dispose();

    super.dispose();
  }

  Future save() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('year', selectedYear);
    await prefs.setInt('month', selectedMonth);
    await prefs.setInt('day', selectedDay);

    await prefs.setString('gender', selectedGender);

    await prefs.setDouble('height', double.parse(_heightController.text));
    await prefs.setDouble('weight', double.parse(_weightController.text));

    logger.info('qwerasdf ==================================');
    logger.info('qwerasdf ${prefs.getInt('year')}');
    logger.info('qwerasdf ${prefs.getInt('month')}');
    logger.info('qwerasdf ${prefs.getInt('day')}');

    logger.info('qwerasdf ${prefs.getString('gender')}');

    logger.info('qwerasdf ${prefs.getDouble('height')}');
    logger.info('qwerasdf ${prefs.getDouble('weight')}');
    logger.info('qwerasdf ==================================');
  }

  Future load() async {
    logger.info('qwerasdf load start==================================');
    final prefs = await SharedPreferences.getInstance();

    final int? lastYear = prefs.getInt('year');
    final int? lastMonth = prefs.getInt('month');
    final int? lastDay = prefs.getInt('day');
    final String? lastGender = prefs.getString('gender');
    final double? lastHeight = prefs.getDouble('height');
    final double? lastWeight = prefs.getDouble('weight');
    logger.info(
        'qwerasdf $lastYear $lastMonth $lastDay $lastGender $lastHeight $lastWeight');

    setState(() {
      selectedYear = lastYear ?? DateTime.now().year;
      selectedMonth = lastMonth ?? 1;
      selectedDay = lastDay ?? 1;
      selectedGender = lastGender?.toString() ?? 'male';
    });
    _heightController.text = lastHeight?.toString() ?? '';
    _weightController.text = lastWeight?.toString() ?? '';
    logger.info('qwerasdf load done==================================');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI mainPage'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Insert your Info',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 5,
                        child: DropdownButtonFormField<int>(
                            decoration: const InputDecoration(
                              labelText: 'Year',
                              border: OutlineInputBorder(),
                            ),
                            value: selectedYear,
                            items: yearList
                                .map(
                                  (e) => DropdownMenuItem(
                                    value: e,
                                    child: Text('$e'),
                                  ),
                                )
                                .toList(),
                            onChanged: (int? value) {
                              setState(() {
                                selectedYear = value ?? 2023;
                                updateDayList();
                              });
                            }),
                      ),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    Expanded(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 5,
                        child: DropdownButtonFormField<int>(
                            decoration: const InputDecoration(
                              labelText: 'Month',
                              border: OutlineInputBorder(),
                            ),
                            value: selectedMonth,
                            items: monthList
                                .map(
                                  (e) => DropdownMenuItem(
                                    value: e,
                                    child: Text('$e'),
                                  ),
                                )
                                .toList(),
                            onChanged: (int? value) {
                              setState(() {
                                selectedMonth = value ?? 1;
                                updateDayList();
                              });
                            }),
                      ),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    Expanded(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 5,
                        child: DropdownButtonFormField<int>(
                            isDense: true,
                            itemHeight: 50.0,
                            decoration: const InputDecoration(
                              labelText: 'Day',
                              border: OutlineInputBorder(),
                            ),
                            value: selectedDay,
                            items: dayList
                                .map(
                                  (e) => DropdownMenuItem(
                                    value: e,
                                    child: Text('$e'),
                                  ),
                                )
                                .toList(),
                            onChanged: (int? value) {
                              setState(() {
                                selectedDay = value ?? 2023;
                              });
                            }),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: RadioListTile<String>(
                        title: const Text('male'),
                        value: 'male',
                        groupValue: selectedGender,
                        onChanged: (value) {
                          setState(() {
                            selectedGender = value ?? '';
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile<String>(
                        title: const Text('female'),
                        value: 'female',
                        groupValue: selectedGender,
                        onChanged: (value) {
                          setState(() {
                            selectedGender = value ?? '';
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16.0,
                ),
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
                  height: 16.0,
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
                  height: 16.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState?.validate() == false) {
                            return;
                          }

                          final height = double.parse(_heightController.text);
                          final weight = double.parse(_weightController.text);

                          save();

                          DateTime now = DateTime.now();
                          int age = now.year - selectedYear;

                          if (now.month < selectedMonth ||
                              (now.month == selectedMonth &&
                                  now.day < selectedDay)) {
                            age--;
                          }

                          final personInfo = PersonInfo(
                              age: age,
                              gender: selectedGender,
                              height: height,
                              weight: weight);

                          context.push(
                            Uri(
                              path: '/resultCalc',
                              queryParameters: {
                                'personInfo': jsonEncode(personInfo.toJson())
                              },
                            ).toString(),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green[300],
                        ),
                        child: const Text(
                          'result',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 32.0,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          _heightController.text = '';
                          _weightController.text = '';

                          setState(() {
                            selectedYear = DateTime.now().year;
                            selectedMonth = DateTime.now().month;
                            selectedDay = DateTime.now().day;
                            selectedGender = 'male';
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        child: const Text(
                          'reset',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
