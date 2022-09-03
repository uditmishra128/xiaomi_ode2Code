import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class AppUser {
  final String? id;
  final String? email;
  final String? name;
  final String? storeType;
  final String? storeName;
  final String? posId;
  AppUser({
    this.id,
    this.email,
    this.name,
    this.storeType,
    this.storeName,
    this.posId,
  });
  AppUser.named({
    this.id,
    this.email,
    this.name,
    this.storeType,
    this.storeName,
    this.posId,
  });
  AppUser copyWith({
    final String? id,
    final String? email,
    final String? name,
    final String? storeType,
    final String? storeName,
    final String? posId,
  }) =>
      AppUser.named(
        id: id ?? this.id,
        email: email ?? this.email,
        name: name ?? this.name,
        storeType: storeType ?? this.storeType,
        storeName: storeName ?? this.storeName,
        posId: posId ?? this.posId,
      );

  factory AppUser.fromJson(json) => _$AppUserFromJson(json);

  Map<String, dynamic> toJson() => _$AppUserToJson(this);
}
