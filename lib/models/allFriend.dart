import 'package:json_annotation/json_annotation.dart';

part 'allFriend.g.dart';

@JsonSerializable()
class AllFriend {
    AllFriend();

    num status;
    List Users;
    
    factory AllFriend.fromJson(Map<String,dynamic> json) => _$AllFriendFromJson(json);
    Map<String, dynamic> toJson() => _$AllFriendToJson(this);
}
