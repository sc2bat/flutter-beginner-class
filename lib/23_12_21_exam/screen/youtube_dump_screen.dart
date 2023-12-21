import 'package:flutter/material.dart';

class YoutubeDumpScreen extends StatelessWidget {
  const YoutubeDumpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
          tag: 'favoriteButton',
          child: Image.network(
              'https://i.namu.wiki/i/jY0H_ZiQ6yTt_BwnP91tdkHtoJ57WjLf2QPxif7bbyTxKtkdc3_WrFDmB0AuNHZB-kuGOjzMJ4nFA-z8TshEkhlmmxiQnV9GNfAZRUML8mzk8Rq9mT_j4sZEtcFXX37kxmIQVKSj5VWCAopxmJQ2tA.webp'),
        ),
      ),
    );
  }
}
