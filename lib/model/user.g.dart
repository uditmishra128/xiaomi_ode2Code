// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppUser _$AppUserFromJson(Map<String, dynamic> json) => AppUser(
      id: json['id'] as String?,
      email: json['email'] as String?,
      name: json['name'] as String?,
      storeType: json['storeType'] as String?,
      storeName: json['storeName'] as String?,
      posId: json['posId'] as String?,
    );

Map<String, dynamic> _$AppUserToJson(AppUser instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'storeType': instance.storeType,
      'storeName': instance.storeName,
      'posId': instance.posId,
    };
