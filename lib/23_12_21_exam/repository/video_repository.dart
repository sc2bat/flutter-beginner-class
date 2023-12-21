import '../model/youtube_video.dart';

class VideoRepository {
  List<YoutubeVideo> videos = [
    YoutubeVideo(
      videoId: '-5Dc8EMVYBo',
      userId: userId,
      title: title,
      viewCount: viewCount,
      uploadTime: uploadTime,
      kind: kind,
      thumnail: 'https://img.youtube.com/vi/-5Dc8EMVYBo/maxresdefault.jpg',
    ),
  ];

  List<YoutubeVideo> getVideos() => videos;
}
