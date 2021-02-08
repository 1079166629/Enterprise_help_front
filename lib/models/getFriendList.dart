import 'package:json_annotation/json_annotation.dart';

part 'getFriendList.g.dart';

@JsonSerializable()
class GetFriendList {
    GetFriendList();

    num status;
    List Users;
    
    factory GetFriendList.fromJson(Map<String,dynamic> json) => _$GetFriendListFromJson(json);
    Map<String, dynamic> toJson() => _$GetFriendListToJson(this);
}
