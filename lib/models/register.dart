import 'package:json_annotation/json_annotation.dart';

part 'register.g.dart';

@JsonSerializable()
class Register {
    Register();

    Map<String,dynamic> user;
    num status;
    
    factory Register.fromJson(Map<String,dynamic> json) => _$RegisterFromJson(json);
    Map<String, dynamic> toJson() => _$RegisterToJson(this);
}
