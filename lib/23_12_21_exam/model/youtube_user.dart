// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class YoutubeUser {
  String userId;
  int alertCount;
  String userPhoto;
  YoutubeUser({
    required this.userId,
    required this.alertCount,
    required this.userPhoto,
  });

  YoutubeUser copyWith({
    String? userId,
    int? alertCount,
    String? userPhoto,
  }) {
    return YoutubeUser(
      userId: userId ?? this.userId,
      alertCount: alertCount ?? this.alertCount,
      userPhoto: userPhoto ?? this.userPhoto,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'alertCount': alertCount,
      'userPhoto': userPhoto,
    };
  }

  factory YoutubeUser.fromMap(Map<String, dynamic> map) {
    return YoutubeUser(
      userId: map['userId'] as String,
      alertCount: map['alertCount'] as int,
      userPhoto: map['userPhoto'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory YoutubeUser.fromJson(String source) =>
      YoutubeUser.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'YoutubeVideo(userId: $userId, alertCount: $alertCount, userPhoto: $userPhoto)';

  @override
  bool operator ==(covariant YoutubeUser other) {
    if (identical(this, other)) return true;

    return other.userId == userId &&
        other.alertCount == alertCount &&
        other.userPhoto == userPhoto;
  }

  @override
  int get hashCode =>
      userId.hashCode ^ alertCount.hashCode ^ userPhoto.hashCode;
}
