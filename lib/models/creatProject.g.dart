// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'creatProject.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreatProject _$CreatProjectFromJson(Map<String, dynamic> json) {
  return CreatProject()
    ..pjName = json['pjName'] as String
    ..pjDeltime = json['pjDeltime'] as String
    ..pjNote = json['pjNote'] as String
    ..pd = json['pd'] as List;
}

Map<String, dynamic> _$CreatProjectToJson(CreatProject instance) =>
    <String, dynamic>{
      'pjName': instance.pjName,
      'pjDeltime': instance.pjDeltime,
      'pjNote': instance.pjNote,
      'pd': instance.pd
    };
