import 'package:json_annotation/json_annotation.dart';

part 'item.g.dart';

@JsonSerializable(explicitToJson: true)
class Item {
  final String? name;
  final int? price;
  final String? imgUrl;
  Item({this.name, this.price, this.imgUrl});

  factory Item.fromJson(json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}
