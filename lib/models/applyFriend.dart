import 'package:json_annotation/json_annotation.dart';

part 'applyFriend.g.dart';

@JsonSerializable()
class ApplyFriend {
    ApplyFriend();

    Map<String,dynamic> application;
    num status;
    
    factory ApplyFriend.fromJson(Map<String,dynamic> json) => _$ApplyFriendFromJson(json);
    Map<String, dynamic> toJson() => _$ApplyFriendToJson(this);
}
