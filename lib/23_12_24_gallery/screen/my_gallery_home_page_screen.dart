import 'package:flutter/material.dart';

class MyGalleryHomePageScreen extends StatefulWidget {
  const MyGalleryHomePageScreen({super.key});

  @override
  State<MyGalleryHomePageScreen> createState() =>
      _MyGalleryHomePageScreenState();
}

class _MyGalleryHomePageScreenState extends State<MyGalleryHomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('my gallery app'),
      ),
      body: Image.network('https://place-hold.it/300x500/666/fff/000.gif'),
    );
  }
}
