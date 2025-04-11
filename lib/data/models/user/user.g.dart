// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  id: json['id'] as String? ?? "",
  firstName: json['firstName'] as String? ?? "",
  lastName: json['lastName'] as String? ?? "",
  password: json['password'] as String? ?? "",
  email: json['email'] as String? ?? "",
  photoURL: json['photoURL'] as String? ?? "",
  signInMethod: const SignInMethodConverter().fromJson(
    json['signInMethod'] as String,
  ),
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'id': instance.id,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'password': instance.password,
  'email': instance.email,
  'photoURL': instance.photoURL,
  'signInMethod': const SignInMethodConverter().toJson(instance.signInMethod),
};
