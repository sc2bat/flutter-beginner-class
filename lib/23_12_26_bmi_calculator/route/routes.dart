import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_beginer_class/23_12_26_bmi_calculator/model/person_info.dart';
import 'package:flutter_beginer_class/23_12_26_bmi_calculator/screen/main_screen.dart';
import 'package:flutter_beginer_class/23_12_26_bmi_calculator/screen/result_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const RouteMainScreen();
      },
    ),
    GoRoute(
      path: '/bmiCalc',
      builder: (context, state) {
        return Container();
      },
    ),
    GoRoute(
      path: '/resultCalc',
      builder: (context, state) {
        final personInfo = PersonInfo.fromJson(
            jsonDecode(state.uri.queryParameters['personInfo']!));
        return RouteResultScreen(
          personInfo: personInfo,
        );
      },
    ),
  ],
);
