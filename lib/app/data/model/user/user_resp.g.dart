// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResp _$UserRespFromJson(Map<String, dynamic> json) => UserResp(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => UserBean.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int?,
      page: json['page'] as int?,
      limit: json['limit'] as int?,
    );

Map<String, dynamic> _$UserRespToJson(UserResp instance) => <String, dynamic>{
      'data': instance.data,
      'total': instance.total,
      'page': instance.page,
      'limit': instance.limit,
    };

UserBean _$UserBeanFromJson(Map<String, dynamic> json) => UserBean(
      id: json['id'] as String?,
      title: json['title'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      picture: json['picture'] as String?,
    );

Map<String, dynamic> _$UserBeanToJson(UserBean instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'picture': instance.picture,
    };
