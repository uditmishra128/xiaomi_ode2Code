// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Bill _$BillFromJson(Map<String, dynamic> json) => Bill(
      customerName: json['customerName'] as String?,
      customerPhone: json['customerPhone'] as String?,
      customerEmail: json['customerEmail'] as String?,
      customerAddress: json['customerAddress'] as String?,
      modeOfComm: $enumDecodeNullable(_$ModeOFCommEnumMap, json['modeOfComm']),
      operatorId: json['operatorId'] as String?,
      storeName: json['storeName'] as String?,
      invoice: json['invoice'] as String?,
      totalAmount: json['totalAmount'] as double?,
      taxAmount: json['taxAmount'] as double?,
      paymentMethod:
          $enumDecodeNullable(_$PaymentMethodEnumMap, json['paymentMethod']),
      serviceOrderNumber: json['serviceOrderNumber'] as String?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Item.fromJson(e))
          .toList(),
    );

Map<String, dynamic> _$BillToJson(Bill instance) => <String, dynamic>{
      'customerName': instance.customerName,
      'customerPhone': instance.customerPhone,
      'customerEmail': instance.customerEmail,
      'customerAddress': instance.customerAddress,
      'modeOfComm': _$ModeOFCommEnumMap[instance.modeOfComm],
      'operatorId': instance.operatorId,
      'storeName': instance.storeName,
      'invoice': instance.invoice,
      'totalAmount': instance.totalAmount,
      'taxAmount': instance.taxAmount,
      'paymentMethod': _$PaymentMethodEnumMap[instance.paymentMethod],
      'serviceOrderNumber': instance.serviceOrderNumber,
      'items': instance.items?.map((e) => e.toJson()).toList(),
    };

const _$ModeOFCommEnumMap = {
  ModeOFComm.whatsapp: 'whatsapp',
  ModeOFComm.email: 'email',
};

const _$PaymentMethodEnumMap = {
  PaymentMethod.online: 'online',
  PaymentMethod.cash: 'cash',
};
