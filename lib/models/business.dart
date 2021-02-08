import 'package:json_annotation/json_annotation.dart';

part 'business.g.dart';

@JsonSerializable()
class Business {
    Business();

    List business;
    
    factory Business.fromJson(Map<String,dynamic> json) => _$BusinessFromJson(json);
    Map<String, dynamic> toJson() => _$BusinessToJson(this);
}
