// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
      productId: json['productId'] as int?,
      catId: json['catId'] as String?,
      name: json['name'] as String?,
      price: json['price'] as int?,
      imgUrl: json['imgUrl'] as String?,
      itemCount: json['itemCount'] as int? ?? 0,
    );

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'productId': instance.productId,
      'catId': instance.catId,
      'name': instance.name,
      'price': instance.price,
      'imgUrl': instance.imgUrl,
      'itemCount': instance.itemCount,
    };
