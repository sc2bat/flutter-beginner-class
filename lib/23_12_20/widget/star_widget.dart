// ignore_for_file: public_member_api_docs, sort_constructors_first, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_beginer_class/23_12_20/model/star.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class StarWidget extends StatefulWidget {
  final Star star;

  const StarWidget({
    super.key,
    required this.star,
  });

  @override
  State<StatefulWidget> createState() => _StarWidgetState();
}

class _StarWidgetState extends State<StarWidget> {
  bool isLiked = false;

  final List<String> miscellaneous = <String>[
    '몽자는 집사의 집에서 살며, 몽실이는 집사의 부모님 집에서 살고 있다. 원래는 부모님 집에서 같이 키웠지만, 몽자가 소리를 많이 질러서 따로 키우기로 했다고 한다.',
    '몽자가 먹는 별사탕처럼 생긴 사료 이름은 독일제 테라카니스 카니레오이다.',
    '몽자의 다양한 표정이 이 채널의 인기 비결이라 생각될 정도로 표정이 많은 강아지다.',
    '몽자는 문이 열려있음에도 불구하고 그 문을 밀어 열지 못하는 반면, 몽실이는 잘 연다. 최근 업로드된 영상에서는 문을 잘 여는 모습을 볼 수 있다.',
    '기본적으로 겁이 많은 듯 보인다. 비닐봉지나 종이봉투가 바스락거리는 소리를 무서워하고, 모기도 무서워한다.',
    '물을 싫어한다. 수영은 물론이고 마시는 물도 그닥 좋아하지 않는다. 때문에 억지로 물을 먹이면 마시는 척만 한다.',
    '오줌을 눌 때 뒷발을 모두 들고 앞발로만 선 기묘한 자세로 눈다.',
    '말 안듣는 말괄량이 꼬마 여자애처럼 생겼고, 실제로도 어릴 땐 사고를 많이 친 모양이지만, 지금은 의외로(?) 훈련이 잘 되어있다. 손, 앉아 등 기본적인 것은 물론이고 분리불안훈련도 잘 되어있는 듯 보인다.',
    '몽자의 원래 이름은 \'팝콘\'이었지만, "몽실이 동생이니 몽자로 하자"고 해서 몽자로 바꿨다고 한다.',
    '무엇보다도 마치 몽자의 실제 마음을 읽는듯한 깔끔하고 센스있는 자막이 몽자의 매력을 한층 더 살려주고 있다며 감탄하는 사람이 많다.',
    '몽자와 몽실이는 9살 차이가 나지만, 몽자는 몽실이에게 조금 버릇 없는 느낌이다. 몽실이 집에 방문한 몽자와 몽실이를 보면, 몽실이가 몽자에게 조금 기가 죽어있고 몽자가 들이대는 느낌이다. 옛날 영상을 보면 몽자도 어릴 적에는 몽실이를 무서워 한 듯 하지만, 지금은 덩치가 비슷해져서인지 몽실이에게 버릇없게 많이 들이댄다.',
    '몽자 엄마는 대부분 얼굴이 나오지 않는 구도로 찍히거나 모자이크 처리되지만, 몽자 아빠는 얼굴이 대놓고 노출된다(간헐적 모자이크)[10]. 몽자 아빠가 몽자를 상대로 유치한 장난을 치는 것도 채널의 인기 포인트 중 하나.',
    '2020년 11월 11일에 몽자의 사진과 짤막한 글귀로 이루어진 에세이가 발간되었다. 사전예약시 포인트 차감 형식으로 몽자의 사진으로 만들어진 엽서형식의 달력이 사은품으로 증정되었고, 발간 후 책 구매시에는 역시 포인트 차감 형식으로 몽자의 썸네일로 이루어진 스티커가 구매 가능하다.',
    '2020년 12월 7일 카카오톡 이모티콘으로 몽자티콘이 출시되었다.',
    '소란의 보컬인 고영배 씨가 몽자의 팬으로 몽자를 위한 헌정곡인 <DANG!(속삭여줘)>을 만들었으며, 몽자가 피쳐링을 하였다.',
    '2021년 11월 새 집으로 이사를 간 영상이 업로드되었다. 구독자들 모두 몽자에게(!) 축하를 보냈다.',
    '유튜브 썸네일들이 하나같이 예술이다.',
  ];

  static String youtubeId = 'CCXLFhIp6Uo';

  final YoutubePlayerController _con = YoutubePlayerController(
    initialVideoId: youtubeId,
    flags: const YoutubePlayerFlags(
      autoPlay: true,
      mute: false,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.network(widget.star.imageUrl),
            ),
            profileArea(),
            YoutubePlayer(
              controller: _con,
            ),
            miscellaneousArea(miscellaneous),
          ],
        ),
      ),
    );
  }

  Widget profileArea() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTextContainer(
                gubun: '견종',
                content: widget.star.dogBread,
              ),
              buildTextContainer(
                gubun: '성별',
                content: widget.star.gender,
              ),
              buildTextContainer(
                gubun: '생일',
                content:
                    '${widget.star.birthDay.year}년 ${widget.star.birthDay.month}월 ${widget.star.birthDay.day}일',
              ),
              buildTextContainer(
                gubun: '채널명',
                content: widget.star.channelName,
              ),
            ],
          ),
        ],
      ),
    );
  }

  miscellaneousArea(List<String> entries) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          const Text(
            '여담',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            padding: const EdgeInsets.all(8),
            itemCount: entries.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding: const EdgeInsets.all(8.0),
                height: 80,
                // color: getRandomColor(),
                child: Text(entries[index]),
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
          ),
        ],
      ),
    );
  }
}

class buildTextContainer extends StatelessWidget {
  const buildTextContainer({
    super.key,
    required this.gubun,
    required this.content,
  });

  final String content;
  final String gubun;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.all(4.0),
          width: 80,
          color: const Color(0xffcd853f),
          child: Text(
            gubun,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.all(4.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xffcd853f),
              width: 2.0,
            ),
          ),
          width: 250,
          child: Text(
            content,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
