// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Login _$LoginFromJson(Map<String, dynamic> json) {
  return Login()
    ..user = json['user'] as Map<String, dynamic>
    ..status = json['status'] as num
    ..token = json['token'] as String;
}

Map<String, dynamic> _$LoginToJson(Login instance) => <String, dynamic>{
      'user': instance.user,
      'status': instance.status,
      'token': instance.token
    };
