// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class StarbucksOrder {
  int orderId;
  String menuName;
  String option;
  String kind;
  DateTime startOrderDate;
  DateTime endOrderDate;
  String imageUrl;
  String location;
  int liked;
  StarbucksOrder({
    required this.orderId,
    required this.menuName,
    required this.option,
    required this.kind,
    required this.startOrderDate,
    required this.endOrderDate,
    required this.imageUrl,
    required this.location,
    required this.liked,
  });

  StarbucksOrder copyWith({
    int? orderId,
    String? menuName,
    String? option,
    String? kind,
    DateTime? startOrderDate,
    DateTime? endOrderDate,
    String? imageUrl,
    String? location,
    int? liked,
  }) {
    return StarbucksOrder(
      orderId: orderId ?? this.orderId,
      menuName: menuName ?? this.menuName,
      option: option ?? this.option,
      kind: kind ?? this.kind,
      startOrderDate: startOrderDate ?? this.startOrderDate,
      endOrderDate: endOrderDate ?? this.endOrderDate,
      imageUrl: imageUrl ?? this.imageUrl,
      location: location ?? this.location,
      liked: liked ?? this.liked,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'orderId': orderId,
      'menuName': menuName,
      'option': option,
      'kind': kind,
      'startOrderDate': startOrderDate.millisecondsSinceEpoch,
      'endOrderDate': endOrderDate.millisecondsSinceEpoch,
      'imageUrl': imageUrl,
      'location': location,
      'liked': liked,
    };
  }

  factory StarbucksOrder.fromMap(Map<String, dynamic> map) {
    return StarbucksOrder(
      orderId: map['orderId'] as int,
      menuName: map['menuName'] as String,
      option: map['option'] as String,
      kind: map['kind'] as String,
      startOrderDate:
          DateTime.fromMillisecondsSinceEpoch(map['startOrderDate'] as int),
      endOrderDate:
          DateTime.fromMillisecondsSinceEpoch(map['endOrderDate'] as int),
      imageUrl: map['imageUrl'] as String,
      location: map['location'] as String,
      liked: map['liked'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory StarbucksOrder.fromJson(String source) =>
      StarbucksOrder.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'StarbucksOrder(orderId: $orderId, menuName: $menuName, option: $option, kind: $kind, startOrderDate: $startOrderDate, endOrderDate: $endOrderDate, imageUrl: $imageUrl, location: $location, liked: $liked)';
  }

  @override
  bool operator ==(covariant StarbucksOrder other) {
    if (identical(this, other)) return true;

    return other.orderId == orderId &&
        other.menuName == menuName &&
        other.option == option &&
        other.kind == kind &&
        other.startOrderDate == startOrderDate &&
        other.endOrderDate == endOrderDate &&
        other.imageUrl == imageUrl &&
        other.location == location &&
        other.liked == liked;
  }

  @override
  int get hashCode {
    return orderId.hashCode ^
        menuName.hashCode ^
        option.hashCode ^
        kind.hashCode ^
        startOrderDate.hashCode ^
        endOrderDate.hashCode ^
        imageUrl.hashCode ^
        location.hashCode ^
        liked.hashCode;
  }
}
