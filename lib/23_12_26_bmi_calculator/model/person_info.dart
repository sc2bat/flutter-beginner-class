// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PersonInfo {
  final int age;
  final String gender;
  final double height;
  final double weight;
  PersonInfo({
    required this.age,
    required this.gender,
    required this.height,
    required this.weight,
  });

  PersonInfo copyWith({
    int? age,
    String? gender,
    double? height,
    double? weight,
  }) {
    return PersonInfo(
      age: age ?? this.age,
      gender: gender ?? this.gender,
      height: height ?? this.height,
      weight: weight ?? this.weight,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'age': age,
      'gender': gender,
      'height': height,
      'weight': weight,
    };
  }

  factory PersonInfo.fromMap(Map<String, dynamic> map) {
    return PersonInfo(
      age: map['age'] as int,
      gender: map['gender'] as String,
      height: map['height'] as double,
      weight: map['weight'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory PersonInfo.fromJson(String source) =>
      PersonInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PersonInfo(age: $age, gender: $gender, height: $height, weight: $weight)';
  }

  @override
  bool operator ==(covariant PersonInfo other) {
    if (identical(this, other)) return true;

    return other.age == age &&
        other.gender == gender &&
        other.height == height &&
        other.weight == weight;
  }

  @override
  int get hashCode {
    return age.hashCode ^ gender.hashCode ^ height.hashCode ^ weight.hashCode;
  }
}
