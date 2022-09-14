// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'billing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Billing _$BillingFromJson(Map<String, dynamic> json) => Billing(
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      address: json['address'] as String?,
      operatorId: json['operatorId'] as String?,
      storeName: json['storeName'] as String?,
      invoice: json['invoice'] as String?,
      totalAmount: json['totalAmount'] as String?,
      taxAmount: json['taxAmount'] as String?,
      paymentMethod: json['paymentMethod'] as String?,
      serviceOrderNumber: json['serviceOrderNumber'] as String?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Item.fromJson(e))
          .toList(),
    );

Map<String, dynamic> _$BillingToJson(Billing instance) => <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
      'email': instance.email,
      'address': instance.address,
      'operatorId': instance.operatorId,
      'storeName': instance.storeName,
      'invoice': instance.invoice,
      'totalAmount': instance.totalAmount,
      'taxAmount': instance.taxAmount,
      'paymentMethod': instance.paymentMethod,
      'serviceOrderNumber': instance.serviceOrderNumber,
      'items': instance.items?.map((e) => e.toJson()).toList(),
    };
