// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'getFriendList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetFriendList _$GetFriendListFromJson(Map<String, dynamic> json) {
  return GetFriendList()
    ..status = json['status'] as num
    ..Users = json['Users'] as List;
}

Map<String, dynamic> _$GetFriendListToJson(GetFriendList instance) =>
    <String, dynamic>{'status': instance.status, 'Users': instance.Users};
