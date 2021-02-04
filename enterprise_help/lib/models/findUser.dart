import 'package:json_annotation/json_annotation.dart';

part 'findUser.g.dart';

@JsonSerializable()
class FindUser {
    FindUser();

    Map<String,dynamic> User;
    num status;
    
    factory FindUser.fromJson(Map<String,dynamic> json) => _$FindUserFromJson(json);
    Map<String, dynamic> toJson() => _$FindUserToJson(this);
}
