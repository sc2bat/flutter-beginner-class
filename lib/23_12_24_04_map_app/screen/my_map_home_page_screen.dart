import 'package:flutter/material.dart';

import '../widget/google_map_widget.dart';

class MyMapHomePageScreen extends StatelessWidget {
  const MyMapHomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('my google map app'),
      ),
      body: const GoogleMapWidget(),
    );
  }
}
