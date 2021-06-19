import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final String firstName;
  final String lastName;
  final DateTime? dateOfBirth;
  User({required this.firstName, required this.lastName, this.dateOfBirth});
  factory User.fromMap(Map<String, dynamic> map) => _$UserFromJson(map);
  factory User.fromJson(String jsonString) =>
      User.fromMap(json.decode(jsonString));
  Map<String, dynamic> toMap() => _$UserToJson(this);

  static List<User> fromJsonList(String jsonList) {
    final list = (json.decode(jsonList) as Map<String, dynamic>)
        .entries
        .map((document) => User.fromMap(document.value));

    return list.toList(growable: false);
  }
}
