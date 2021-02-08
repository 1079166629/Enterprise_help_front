import 'package:json_annotation/json_annotation.dart';

part 'ReleaseProject.g.dart';

@JsonSerializable()
class ReleaseProject {
    ReleaseProject();

    Map<String,dynamic> project;
    num status;
    
    factory ReleaseProject.fromJson(Map<String,dynamic> json) => _$ReleaseProjectFromJson(json);
    Map<String, dynamic> toJson() => _$ReleaseProjectToJson(this);
}
