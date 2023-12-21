import '../model/youtube_video.dart';

class VideoRepository {
  List<YoutubeVideo> videos = [
    YoutubeVideo(
      videoId: '-5Dc8EMVYBo',
      uploadId: 'Warner Bros. Korea',
      title: '[듄] 메인 예고편',
      viewCount: 1140000,
      uploadTime: DateTime(2021, 10, 5),
      kind: 'video',
      thumnail: 'https://img.youtube.com/vi/-5Dc8EMVYBo/maxresdefault.jpg',
    ),
    YoutubeVideo(
      videoId: 'aa0WjdSYdCk',
      uploadId: '소니픽쳐스코리아',
      title: '[스파이더맨: 어크로스 더 유니버스] 인터내셔널 예고편',
      viewCount: 321234,
      uploadTime: DateTime(2023, 5, 9),
      kind: 'video',
      thumnail: 'https://img.youtube.com/vi/aa0WjdSYdCk/maxresdefault.jpg',
    ),
    YoutubeVideo(
      videoId: 'b0yAOYIvP1Y',
      uploadId: '유니버설 픽쳐스',
      title: '[쿵푸팬더 4] 1차 예고편 (HD)',
      viewCount: 470429,
      uploadTime: DateTime(2023, 5, 9),
      kind: 'video',
      thumnail: 'https://img.youtube.com/vi/b0yAOYIvP1Y/maxresdefault.jpg',
    ),
    YoutubeVideo(
      videoId: 'E3leN6mu9Ow',
      uploadId: '지우해',
      title: '[엔믹스] 오해원표 소름돋는 알람소리',
      viewCount: 34242513,
      uploadTime: DateTime(2023, 3, 3),
      kind: 'short',
      thumnail: 'https://i.ytimg.com/vi/E3leN6mu9Ow/oar2.jpg',
    ),
    YoutubeVideo(
      videoId: 'GVU65rFJMrQ',
      uploadId: 'Sassy Tullahassee',
      title: 'Sassy Tullahassee 18.02 at the jail!!',
      viewCount: 65778,
      uploadTime: DateTime(2022, 2, 2),
      kind: 'short',
      thumnail: 'https://i.ytimg.com/vi/GVU65rFJMrQ/oar2.jpg',
    ),
    YoutubeVideo(
      videoId: '58N2Y0D-K_c',
      uploadId: '플리즈 plz',
      title: '꼰대희에 질문빌런 등장',
      viewCount: 111111,
      uploadTime: DateTime(2023, 3, 4),
      kind: 'short',
      thumnail: 'https://i.ytimg.com/vi/58N2Y0D-K_c/oar2.jpg',
    ),
    YoutubeVideo(
      videoId: 'o3Ohq8WdWrI',
      uploadId: 'LE SSERAFIM',
      title: 'Perfect Night with',
      viewCount: 65778,
      uploadTime: DateTime(2022, 2, 2),
      kind: 'short',
      thumnail: 'https://i.ytimg.com/vi/o3Ohq8WdWrI/oar2.jpg',
    ),
    YoutubeVideo(
      videoId: 'AdQ_cPn_sXY',
      uploadId: '리즈시절',
      title: '캐리비안의 해적 조니 뎁 리즈시절',
      viewCount: 1414141411,
      uploadTime: DateTime(2020, 1, 1),
      kind: 'short',
      thumnail: 'https://i.ytimg.com/vi/AdQ_cPn_sXY/oar2.jpg',
    ),
  ];

  List<YoutubeVideo> getVideos() => videos;
}
