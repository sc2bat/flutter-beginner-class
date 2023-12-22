import 'package:flutter_beginer_class/23_12_22_starbucks/model/card.dart';

class CardRepository {
  List<StarbucksCard> crads = [
    StarbucksCard(
        cardId: 10401,
        title: '12월 20일, 그리팅 카드 및 모바일 상품권 잔액 충전 서비스 안내',
        description: 'Greeting Card & 물품형 모바일 상품권 잔액 충전 기능 오픈!',
        kind: 'news',
        startDate: DateTime(2023, 1, 1),
        endDate: DateTime(2023, 12, 31),
        imageUrl: '04_01_cardnews.png'),
    StarbucksCard(
        cardId: 10402,
        title: '스벅TV \'스타벅스 10대 매장\' 선정 기념 구독자 이벤트',
        description: '스타벅스 코리아 10대 매장을 스벅TV에서 만나보세요!',
        kind: 'news',
        startDate: DateTime(2023, 1, 1),
        endDate: DateTime(2023, 12, 31),
        imageUrl: '04_02_cardnews.png'),
    StarbucksCard(
        cardId: 10403,
        title: '스타벅스 앱 보안 강화',
        description: '안전한 서비스 이용을 위하여 Pay 탭 이용, 다중 기기/해외 로그인 시 인증 절차 적용',
        kind: 'news',
        startDate: DateTime(2023, 1, 1),
        endDate: DateTime(2023, 12, 31),
        imageUrl: '04_03_cardnews.png'),
    StarbucksCard(
        cardId: 10404,
        title: '기장임랑원 크리스마스 이벤트',
        description: '기장임랑원 글라스하우스에서 베어리스타와 특별한 크리스마스 추억을 남겨보세요.',
        kind: 'news',
        startDate: DateTime(2023, 1, 1),
        endDate: DateTime(2023, 12, 31),
        imageUrl: '04_04_cardnews.png'),
    StarbucksCard(
        cardId: 10405,
        title: '굿바이 2023 사이즈업 이벤트',
        description: '골드 회원 고객님, 사이즈업 쿠폰으로 스타벅스와 함께 연말의 즐거움을 더 크게 느껴보세요!',
        kind: 'news',
        startDate: DateTime(2023, 1, 1),
        endDate: DateTime(2023, 12, 31),
        imageUrl: '04_05_cardnews.png'),
    StarbucksCard(
        cardId: 10406,
        title: '12월 14일, 치킨 베이컨 랩 출시',
        description: '간편하고 든든한 치킨 베이컨 랩을 만나보세요.',
        kind: 'news',
        startDate: DateTime(2023, 1, 1),
        endDate: DateTime(2023, 12, 31),
        imageUrl: '04_06_cardnews.png'),
    StarbucksCard(
        cardId: 10407,
        title: '스타벅스 더북한강R점에서 함께하는 12월 유기견 입양 캠페인',
        description: '',
        kind: 'news',
        startDate: DateTime(2023, 1, 1),
        endDate: DateTime(2023, 12, 31),
        imageUrl: '04_07_cardnews.png'),
    StarbucksCard(
        cardId: 10408,
        title: '12월 12일, 이커머스 전용 테라조 MD 출시',
        description: '테라조 패턴으로 익숙한 공간에 포인트를 더해보세요.',
        kind: 'news',
        startDate: DateTime(2023, 1, 1),
        endDate: DateTime(2023, 12, 31),
        imageUrl: '04_08_cardnews.png'),
    StarbucksCard(
        cardId: 10409,
        title: '12월 스타벅스 일회용컵 없는 날!',
        description: '12월 스타벅스 일회용컵 없는 날!',
        kind: 'news',
        startDate: DateTime(2023, 1, 1),
        endDate: DateTime(2023, 12, 31),
        imageUrl: '04_09_cardnews.png'),
    StarbucksCard(
        cardId: 10410,
        title: '2023 윈터 e-프리퀀시 이벤트 안내',
        description: '2023 윈터 e-프리퀀시 이벤트 안내',
        kind: 'news',
        startDate: DateTime(2023, 1, 1),
        endDate: DateTime(2023, 12, 31),
        imageUrl: '04_10_cardnews.png'),
    StarbucksCard(
        cardId: 10411,
        title: '2023 윈터 e-프리퀀시 예약시스템 이용 안내',
        description: '2023 윈터 e-프리퀀시 예약시스템 이용 안내',
        kind: 'news',
        startDate: DateTime(2023, 1, 1),
        endDate: DateTime(2023, 12, 31),
        imageUrl: '04_11_cardnews.png'),
    StarbucksCard(
        cardId: 10412,
        title: '만원 별 적립 이벤트1',
        description: '결제 금액 1만원당 별 1개 추가 적립1',
        kind: 'news',
        startDate: DateTime(2023, 1, 1),
        endDate: DateTime(2023, 12, 31),
        imageUrl: '04_12_cardnews.png'),
  ];

  List<StarbucksCard> getAllCards() => crads;

  List<StarbucksCard> getNewsCards() => crads
      .where(
        (element) => element.kind == 'news',
      )
      .toList();
}
