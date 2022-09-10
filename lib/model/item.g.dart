// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
      name: json['name'] as String?,
      price: json['price'] as int?,
      imgUrl: json['imgUrl'] as String?,
    );

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'name': instance.name,
      'price': instance.price,
      'imgUrl': instance.imgUrl,
    };
