import 'package:json_annotation/json_annotation.dart';

part 'findFriendApl.g.dart';

@JsonSerializable()
class FindFriendApl {
    FindFriendApl();

    List applyFriends;
    num status;
    
    factory FindFriendApl.fromJson(Map<String,dynamic> json) => _$FindFriendAplFromJson(json);
    Map<String, dynamic> toJson() => _$FindFriendAplToJson(this);
}
