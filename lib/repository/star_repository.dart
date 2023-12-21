import 'package:flutter_beginer_class/23_12_20/model/star.dart';

class StarRepository {
  final List<Star> stars = [
    Star(
        id: 1,
        dogBread: '푸들',
        gender: 'female',
        birthDay: DateTime(2016, 4, 8),
        channelName: '속삭이는몽자',
        imageUrl:
            'https://i.namu.wiki/i/44PjLeJaD8ycDCsibi4Mc4pX_5hY1QuhWHNvA9hC4OpXxpPFEBHz8GrSCeMhWYFER4zkElbcYYfCIIrqBKKQhHYEBdNxt-i_RscoD7z2HxgPf4G6Mcz6siFhbxXKrZdFk5fKVUf_2zWG4azmj_PVWg.webp'),
    Star(
        id: 2,
        dogBread: '먼치킨 믹스',
        gender: 'male',
        birthDay: DateTime(2017, 1, 1),
        channelName: '루루',
        imageUrl:
            'https://i.namu.wiki/i/aIJAs_9HUTfAgUWtF1R3dBAom6Aq-A7Xe2aQp-N7RsTOvWHGZleuNj9i47a2Pa8UrwHZ0jUPCfCxfySdA49qpStloZy22QK63jKQu4du0sD9ueidgSb0CdVwGVf8Qi3IxdZajSvCNjhHTazEVY0FCA.webp')
  ];

  List<Star> getStars() => stars;
}
