// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int?,
      name: json['name'] as String,
      email: json['email'] as String,
      gender: $enumDecode(_$GenderEnumMap, json['gender']),
      status: $enumDecode(_$UserStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'gender': _$GenderEnumMap[instance.gender]!,
      'status': _$UserStatusEnumMap[instance.status]!,
    };

const _$GenderEnumMap = {
  Gender.Male: 'Male',
  Gender.Female: 'Female',
  Gender.all: 'all',
};

const _$UserStatusEnumMap = {
  UserStatus.Inactive: 'Inactive',
  UserStatus.Active: 'Active',
  UserStatus.all: 'all',
};
