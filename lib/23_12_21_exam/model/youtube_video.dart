// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class YoutubeVideo {
  String videoId;
  String uploadId;
  String title;
  int viewCount;
  DateTime uploadTime;
  String kind;
  String thumnail;
  YoutubeVideo({
    required this.videoId,
    required this.uploadId,
    required this.title,
    required this.viewCount,
    required this.uploadTime,
    required this.kind,
    required this.thumnail,
  });

  YoutubeVideo copyWith({
    String? videoId,
    String? uploadId,
    String? title,
    int? viewCount,
    DateTime? uploadTime,
    String? kind,
    String? thumnail,
  }) {
    return YoutubeVideo(
      videoId: videoId ?? this.videoId,
      uploadId: uploadId ?? this.uploadId,
      title: title ?? this.title,
      viewCount: viewCount ?? this.viewCount,
      uploadTime: uploadTime ?? this.uploadTime,
      kind: kind ?? this.kind,
      thumnail: thumnail ?? this.thumnail,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'videoId': videoId,
      'uploadId': uploadId,
      'title': title,
      'viewCount': viewCount,
      'uploadTime': uploadTime.millisecondsSinceEpoch,
      'kind': kind,
      'thumnail': thumnail,
    };
  }

  factory YoutubeVideo.fromMap(Map<String, dynamic> map) {
    return YoutubeVideo(
      videoId: map['videoId'] as String,
      uploadId: map['uploadId'] as String,
      title: map['title'] as String,
      viewCount: map['viewCount'] as int,
      uploadTime: DateTime.fromMillisecondsSinceEpoch(map['uploadTime'] as int),
      kind: map['kind'] as String,
      thumnail: map['thumnail'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory YoutubeVideo.fromJson(String source) =>
      YoutubeVideo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'YoutubeVideo(videoId: $videoId, uploadId: $uploadId, title: $title, viewCount: $viewCount, uploadTime: $uploadTime, kind: $kind, thumnail: $thumnail)';
  }

  @override
  bool operator ==(covariant YoutubeVideo other) {
    if (identical(this, other)) return true;

    return other.videoId == videoId &&
        other.uploadId == uploadId &&
        other.title == title &&
        other.viewCount == viewCount &&
        other.uploadTime == uploadTime &&
        other.kind == kind &&
        other.thumnail == thumnail;
  }

  @override
  int get hashCode {
    return videoId.hashCode ^
        uploadId.hashCode ^
        title.hashCode ^
        viewCount.hashCode ^
        uploadTime.hashCode ^
        kind.hashCode ^
        thumnail.hashCode;
  }
}
