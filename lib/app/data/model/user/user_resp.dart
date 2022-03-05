import 'package:json_annotation/json_annotation.dart'; 

part 'user_resp.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class UserResp {
  @JsonKey(name: 'data')
  List<UserBean>? data;
  @JsonKey(name: 'total')
  int? total;
  @JsonKey(name: 'page')
  int? page;
  @JsonKey(name: 'limit')
  int? limit;

  UserResp({this.data, this.total, this.page, this.limit});

   factory UserResp.fromJson(Map<String, dynamic> json) => _$UserRespFromJson(json);

   Map<String, dynamic> toJson() => _$UserRespToJson(this);
}

@JsonSerializable(ignoreUnannotated: false)
class UserBean {
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'firstName')
  String? firstName;
  @JsonKey(name: 'lastName')
  String? lastName;
  @JsonKey(name: 'picture')
  String? picture;

  UserBean({this.id, this.title, this.firstName, this.lastName, this.picture});

   factory UserBean.fromJson(Map<String, dynamic> json) => _$UserBeanFromJson(json);

   Map<String, dynamic> toJson() => _$UserBeanToJson(this);
}

