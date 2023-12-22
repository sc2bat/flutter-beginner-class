// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class StarbucksCard {
  int cardId;
  String title;
  String description;
  String kind;
  DateTime startDate;
  DateTime endDate;
  String imageUrl;
  StarbucksCard({
    required this.cardId,
    required this.title,
    required this.description,
    required this.kind,
    required this.startDate,
    required this.endDate,
    required this.imageUrl,
  });

  StarbucksCard copyWith({
    int? cardId,
    String? title,
    String? description,
    String? kind,
    DateTime? startDate,
    DateTime? endDate,
    String? imageUrl,
  }) {
    return StarbucksCard(
      cardId: cardId ?? this.cardId,
      title: title ?? this.title,
      description: description ?? this.description,
      kind: kind ?? this.kind,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cardId': cardId,
      'title': title,
      'description': description,
      'kind': kind,
      'startDate': startDate.millisecondsSinceEpoch,
      'endDate': endDate.millisecondsSinceEpoch,
      'imageUrl': imageUrl,
    };
  }

  factory StarbucksCard.fromMap(Map<String, dynamic> map) {
    return StarbucksCard(
      cardId: map['cardId'] as int,
      title: map['title'] as String,
      description: map['description'] as String,
      kind: map['kind'] as String,
      startDate: DateTime.fromMillisecondsSinceEpoch(map['startDate'] as int),
      endDate: DateTime.fromMillisecondsSinceEpoch(map['endDate'] as int),
      imageUrl: map['imageUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory StarbucksCard.fromJson(String source) =>
      StarbucksCard.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'StarBucksCard(cardId: $cardId, title: $title, description: $description, kind: $kind, startDate: $startDate, endDate: $endDate, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(covariant StarbucksCard other) {
    if (identical(this, other)) return true;

    return other.cardId == cardId &&
        other.title == title &&
        other.description == description &&
        other.kind == kind &&
        other.startDate == startDate &&
        other.endDate == endDate &&
        other.imageUrl == imageUrl;
  }

  @override
  int get hashCode {
    return cardId.hashCode ^
        title.hashCode ^
        description.hashCode ^
        kind.hashCode ^
        startDate.hashCode ^
        endDate.hashCode ^
        imageUrl.hashCode;
  }
}
