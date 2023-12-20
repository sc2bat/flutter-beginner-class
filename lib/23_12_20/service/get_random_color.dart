// ignore_for_file: public_member_api_docs, sort_constructors_first, camel_case_types

import 'dart:math';

import 'package:flutter/material.dart';

Color getRandomColor() {
  final Random random = Random();
  return Color.fromRGBO(
    random.nextInt(256),
    random.nextInt(256),
    random.nextInt(256),
    1.0,
  );
}
