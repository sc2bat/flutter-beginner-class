import 'package:flutter/material.dart';

import '../../repository/star_repository.dart';
import 'star_detail_screen.dart';

class CheckBoxScreen extends StatefulWidget {
  const CheckBoxScreen({super.key});

  @override
  State<CheckBoxScreen> createState() => _CheckBoxListScreen();
}

class _CheckBoxListScreen extends State<CheckBoxScreen> {
  final repository = StarRepository();

  final likes = <int>{};

  @override
  Widget build(BuildContext context) {
    final myStars = repository.getStars();

    return Scaffold(
      appBar: AppBar(
        title: const Text('appbar star'),
        backgroundColor: Colors.amberAccent,
      ),
      body: ListView(
        children: myStars.map((e) {
          return Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StarDetailScreen(
                        star: e,
                      ),
                      fullscreenDialog: true,
                    ),
                  );
                },
                child: Image.network(
                  e.imageUrl,
                ),
              ),
              CheckboxListTile(
                  title: Text(e.channelName),
                  value: likes.contains(e.id),
                  onChanged: (bool? value) {
                    if (value != null) {
                      setState(() =>
                          value == true ? likes.add(e.id) : likes.remove(e.id));
                    }
                  }),
            ],
          );
        }).toList(),
      ),
    );
  }
}
