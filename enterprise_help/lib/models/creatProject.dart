import 'package:json_annotation/json_annotation.dart';

part 'creatProject.g.dart';

@JsonSerializable()
class CreatProject {
    CreatProject();

    String pjName;
    String pjDeltime;
    String pjNote;
    List pd;
    
    factory CreatProject.fromJson(Map<String,dynamic> json) => _$CreatProjectFromJson(json);
    Map<String, dynamic> toJson() => _$CreatProjectToJson(this);
}
