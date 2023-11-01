import 'package:flutter/foundation.dart' show immutable;

@immutable
class UserEntity {
  const UserEntity({
    this.id,
    required this.name,
    required this.email,
    required this.gender,
    required this.status,
  });

  final int? id;
  final String name;
  final String email;
  final Gender gender;
  final UserStatus status;
}

enum Gender { Male, Female, all }

enum UserStatus { Inactive, Active, all }
