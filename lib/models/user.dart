import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  User({required this.firstName, required this.lastName, this.dateOfBirth});

  factory User.fromMap(Map<String, dynamic> map) => _$UserFromJson(map);
  factory User.fromJson(String jsonString) =>
      User.fromMap(json.decode(jsonString) as Map<String, dynamic>);

  final String firstName;
  final String lastName;
  final DateTime? dateOfBirth;

  Map<String, dynamic> toMap() => _$UserToJson(this);

  static List<User> fromJsonList(String jsonList) {
    final List<User> list = (json.decode(jsonList) as Map<String, dynamic>)
        .entries
        .map(
          (MapEntry<String, dynamic> document) =>
              User.fromMap(document.value as Map<String, dynamic>),
        )
        .toList(growable: false);

    return list;
  }
}
