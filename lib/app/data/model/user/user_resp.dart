import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';

part 'user_resp.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class UserResp {
  @JsonKey(name: 'data')
  List<UserEntity>? data;
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

@HiveType(typeId: 0)
@JsonSerializable(ignoreUnannotated: false)
class UserEntity extends HiveObject{
  @JsonKey(name: 'id')
  @HiveField(0)
  String? id;
  @JsonKey(name: 'title')
  @HiveField(1)
  String? title;
  @JsonKey(name: 'firstName')
  @HiveField(2)
  String? firstName;
  @JsonKey(name: 'lastName')
  @HiveField(3)
  String? lastName;
  @JsonKey(name: 'picture')
  @HiveField(4)
  String? picture;

  UserEntity({this.id, this.title, this.firstName, this.lastName, this.picture});

   factory UserEntity.fromJson(Map<String, dynamic> json) => _$UserEntityFromJson(json);

   Map<String, dynamic> toJson() => _$UserEntityToJson(this);
}

