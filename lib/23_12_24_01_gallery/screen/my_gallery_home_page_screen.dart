import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:simple_logger/simple_logger.dart';

final logger = SimpleLogger();

class MyGalleryHomePageScreen extends StatefulWidget {
  const MyGalleryHomePageScreen({super.key});

  @override
  State<MyGalleryHomePageScreen> createState() =>
      _MyGalleryHomePageScreenState();
}

class _MyGalleryHomePageScreenState extends State<MyGalleryHomePageScreen> {
  final ImagePicker _imagePicker = ImagePicker();
  List<XFile>? images;
  int _currentPage = 0;
  final _pageController = PageController();

  @override
  void initState() {
    super.initState();
    loadImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('my gallery app'),
      ),
      body:
          // Image.network('https://place-hold.it/300x500/666/fff/000.gif'),
          images == null
              ? const Center(
                  child: Text(
                    'My Gallery',
                  ),
                )
              : PageView(
                  controller: _pageController,
                  children: images!.map(
                    (e) {
                      return FutureBuilder<Uint8List>(
                        future: e.readAsBytes(),
                        builder: (context, snapshot) {
                          final data = snapshot.data;

                          if (data == null ||
                              snapshot.connectionState ==
                                  ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          return Image.memory(
                            data,
                            width: double.infinity,
                          );
                        },
                      );
                    },
                  ).toList(),
                ),
    );
  }

  Future<void> loadImages() async {
    images = await _imagePicker.pickMultiImage();

    if (images != null) {
      Timer.periodic(const Duration(seconds: 3), (timer) {
        logger.info('qwerasdf $_currentPage');
        _currentPage++;
        if (_currentPage > images!.length - 1) {
          _currentPage = 0;
        }
        _pageController.animateToPage(_currentPage,
            duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
      });
    }

    setState(() {
      logger.info('qwerasdf loadImages Function setState');
    });

    logger.info('qwerasdf $images');
  }
}
