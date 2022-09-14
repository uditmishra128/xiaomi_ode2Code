import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'item.g.dart';

@JsonSerializable(explicitToJson: true)
class Item {
  int? productId;
  final String? catId;
  final String? name;
  final int? price;
  final String? imgUrl;
  int itemCount;
  Item(
      {this.productId,
      this.catId,
      this.name,
      this.price,
      this.imgUrl,
      this.itemCount = 0});

  factory Item.fromJson(json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
  static String encode(List<Item> items) => jsonEncode(
        items.map<Map<String, dynamic>>((item) => item.toJson()).toList(),
      );

  static List<Item> decode(String items) => (jsonDecode(items) as List<dynamic>)
      .map<Item>((item) => Item.fromJson(item))
      .toList();
}
