// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ReleaseProject.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReleaseProject _$ReleaseProjectFromJson(Map<String, dynamic> json) {
  return ReleaseProject()
    ..project = json['project'] as Map<String, dynamic>
    ..status = json['status'] as num;
}

Map<String, dynamic> _$ReleaseProjectToJson(ReleaseProject instance) =>
    <String, dynamic>{'project': instance.project, 'status': instance.status};
