// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class YoutubeDumpScreen extends StatelessWidget {
  final int selectIndex;

  const YoutubeDumpScreen({
    Key? key,
    required this.selectIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageList = [
      'https://i.namu.wiki/i/jY0H_ZiQ6yTt_BwnP91tdkHtoJ57WjLf2QPxif7bbyTxKtkdc3_WrFDmB0AuNHZB-kuGOjzMJ4nFA-z8TshEkhlmmxiQnV9GNfAZRUML8mzk8Rq9mT_j4sZEtcFXX37kxmIQVKSj5VWCAopxmJQ2tA.webp',
      'https://i.namu.wiki/i/XP77MTvHZFp4B2owmwlDoHIABCRVQnx6srRkSJaHS_kINtXpaGZCJBQfS-cEr6FUdUslB-UIcBw1GgkEyi9kFssRZwSLCfhJDqibK8E3Wzq68BSuJ9LYmsqiIhJPetk0XStts8Z0aUWljwpKTB23uA.webp',
      'https://i.namu.wiki/i/TYa9IwZIwI_D3C0eJ4LMpCCQKuC6NzpdPraTNlHl_wql_vDiN47j33jg6PTQPNFPDFomEj2RArzwhBftygdkz7geQJD6OudqoclzNmBWeX8EiUUXGh2K6FCGhb4yaHnhl9FO9b0ynB3oE6JTAcrJGw.webp',
      'https://i.namu.wiki/i/WR1Jv-9nQ8sWgcTuOo0DCUpN3sVO7xQeHEBexOjICGVYZqKJ5ZVsR2-irvAYIjqmFZw1Xrh6wer6Hpz8ROm5JRf3qIZUFyiHsUJabFSxtPYDqAGAAKyVdrD_bJCWS_jl2PYfw-ZyFtTyBB83-CSwpQ.webp',
      'https://i.namu.wiki/i/0OOtvwiXYxN1hbR-2h7MQjyprYK2rLnSmg0W2Qr_nch1eMiDIppzGlapvP7ITy7VhR85cfDNtdC_cedW3YyfC3zeU_qQp8QVH0zwztwWNGDzDLg3U3z4hlvZ2-5SNWZE7y3uKct73gpRPLNH3OKofg.webp',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('youtube dump Screen'),
      ),
      body: Center(
        child: Image.network(imageList[selectIndex]),
      ),
    );
  }
}
