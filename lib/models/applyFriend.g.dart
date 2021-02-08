// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'applyFriend.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApplyFriend _$ApplyFriendFromJson(Map<String, dynamic> json) {
  return ApplyFriend()
    ..application = json['application'] as Map<String, dynamic>
    ..status = json['status'] as num;
}

Map<String, dynamic> _$ApplyFriendToJson(ApplyFriend instance) =>
    <String, dynamic>{
      'application': instance.application,
      'status': instance.status
    };
