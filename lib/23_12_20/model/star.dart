// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

class Star {
  int id;
  String dogBread;
  String gender;
  DateTime birthDay;
  String channelName;
  String imageUrl;
  Star({
    required this.id,
    required this.dogBread,
    required this.gender,
    required this.birthDay,
    required this.channelName,
    required this.imageUrl,
  });

  Star copyWith({
    int? id,
    String? dogBread,
    String? gender,
    DateTime? birthDay,
    String? channelName,
    String? imageUrl,
  }) {
    return Star(
      id: id ?? this.id,
      dogBread: dogBread ?? this.dogBread,
      gender: gender ?? this.gender,
      birthDay: birthDay ?? this.birthDay,
      channelName: channelName ?? this.channelName,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'dogBread': dogBread,
      'gender': gender,
      'birthDay': birthDay.millisecondsSinceEpoch,
      'channelName': channelName,
      'imageUrl': imageUrl,
    };
  }

  factory Star.fromMap(Map<String, dynamic> map) {
    return Star(
      id: map['id'] as int,
      dogBread: map['dogBread'] as String,
      gender: map['gender'] as String,
      birthDay: DateTime.fromMillisecondsSinceEpoch(map['birthDay'] as int),
      channelName: map['channelName'] as String,
      imageUrl: map['imageUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Star.fromJson(String source) =>
      Star.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Star(id: $id, dogBread: $dogBread, gender: $gender, birthDay: $birthDay, channelName: $channelName, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(covariant Star other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.dogBread == dogBread &&
        other.gender == gender &&
        other.birthDay == birthDay &&
        other.channelName == channelName &&
        other.imageUrl == imageUrl;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        dogBread.hashCode ^
        gender.hashCode ^
        birthDay.hashCode ^
        channelName.hashCode ^
        imageUrl.hashCode;
  }
}
