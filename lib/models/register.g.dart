// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Register _$RegisterFromJson(Map<String, dynamic> json) {
  return Register()
    ..user = json['user'] as Map<String, dynamic>
    ..status = json['status'] as num;
}

Map<String, dynamic> _$RegisterToJson(Register instance) =>
    <String, dynamic>{'user': instance.user, 'status': instance.status};
