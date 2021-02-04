// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'findUser.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FindUser _$FindUserFromJson(Map<String, dynamic> json) {
  return FindUser()
    ..User = json['User'] as Map<String, dynamic>
    ..status = json['status'] as num;
}

Map<String, dynamic> _$FindUserToJson(FindUser instance) =>
    <String, dynamic>{'User': instance.User, 'status': instance.status};
