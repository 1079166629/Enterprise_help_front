import 'package:json_annotation/json_annotation.dart';

part 'usrBusiness.g.dart';

@JsonSerializable()
class UsrBusiness {
    UsrBusiness();

    List business;
    String status;
    
    factory UsrBusiness.fromJson(Map<String,dynamic> json) => _$UsrBusinessFromJson(json);
    Map<String, dynamic> toJson() => _$UsrBusinessToJson(this);
}
