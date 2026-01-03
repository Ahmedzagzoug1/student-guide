// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      classNumber: json['classNumber'] as String,
      imageUrl: json['imageUrl'] as String,
      registerAt: DateTime.parse(json['registerAt'] as String),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'classNumber': instance.classNumber,
      'imageUrl': instance.imageUrl,
      'registerAt': instance.registerAt.toIso8601String(),
    };
