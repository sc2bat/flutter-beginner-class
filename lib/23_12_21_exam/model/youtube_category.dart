// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class YoutubeCategory {
  int categoryId;
  String categoryName;
  int categoryChoice;
  YoutubeCategory({
    required this.categoryId,
    required this.categoryName,
    required this.categoryChoice,
  });

  YoutubeCategory copyWith({
    int? categoryId,
    String? categoryName,
    int? categoryChoice,
  }) {
    return YoutubeCategory(
      categoryId: categoryId ?? this.categoryId,
      categoryName: categoryName ?? this.categoryName,
      categoryChoice: categoryChoice ?? this.categoryChoice,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'categoryId': categoryId,
      'categoryName': categoryName,
      'categoryChoice': categoryChoice,
    };
  }

  factory YoutubeCategory.fromMap(Map<String, dynamic> map) {
    return YoutubeCategory(
      categoryId: map['categoryId'] as int,
      categoryName: map['categoryName'] as String,
      categoryChoice: map['categoryChoice'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory YoutubeCategory.fromJson(String source) =>
      YoutubeCategory.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'YoutubeCategory(categoryId: $categoryId, categoryName: $categoryName, categoryChoice: $categoryChoice)';

  @override
  bool operator ==(covariant YoutubeCategory other) {
    if (identical(this, other)) return true;

    return other.categoryId == categoryId &&
        other.categoryName == categoryName &&
        other.categoryChoice == categoryChoice;
  }

  @override
  int get hashCode =>
      categoryId.hashCode ^ categoryName.hashCode ^ categoryChoice.hashCode;
}
