// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usrBusiness.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsrBusiness _$UsrBusinessFromJson(Map<String, dynamic> json) {
  return UsrBusiness()
    ..business = json['business'] as List
    ..status = json['status'] as String;
}

Map<String, dynamic> _$UsrBusinessToJson(UsrBusiness instance) =>
    <String, dynamic>{'business': instance.business, 'status': instance.status};
