import 'package:json_annotation/json_annotation.dart';
import 'package:xiomi_ode_to_code/model/item.dart';
part 'billing.g.dart';

@JsonSerializable(explicitToJson: true)
class Billing {
  final String? name;
  final String? phone;
  final String? email;
  final String? address;
  final String? operatorId;
  final String? storeName;
  final String? invoice;
  final String? totalAmount;
  final String? taxAmount;
  final String? paymentMethod;
  final String? serviceOrderNumber;
  final List<Item>? items;
  Billing(
      {this.name,
      this.phone,
      this.email,
      this.address,
      this.operatorId,
      this.storeName,
      this.invoice,
      this.totalAmount,
      this.taxAmount,
      this.paymentMethod,
      this.serviceOrderNumber,
      this.items});
  Billing.named(
      {this.name,
      this.phone,
      this.email,
      this.address,
      this.operatorId,
      this.storeName,
      this.invoice,
      this.totalAmount,
      this.taxAmount,
      this.paymentMethod,
      this.serviceOrderNumber,
      this.items});
  Billing copyWith({
    final String? name,
    final String? phone,
    final String? email,
    final String? address,
    final String? operatorId,
    final String? storeName,
    final String? invoice,
    final String? totalAmount,
    final String? taxAmount,
    final String? paymentMethod,
    final String? serviceOrderNumber,
    final List<Item>? items,
  }) =>
      Billing.named(
          name: name ?? this.name,
          phone: phone ?? this.phone,
          email: email ?? this.email,
          address: address ?? this.address,
          operatorId: operatorId ?? this.operatorId,
          storeName: storeName ?? this.storeName,
          invoice: invoice ?? this.invoice,
          totalAmount: totalAmount ?? this.totalAmount,
          taxAmount: taxAmount ?? this.taxAmount,
          paymentMethod: paymentMethod ?? this.paymentMethod,
          serviceOrderNumber: serviceOrderNumber ?? this.serviceOrderNumber,
          items: items ?? this.items);
  factory Billing.fromJson(json) => _$BillingFromJson(json);

  Map<String, dynamic> toJson() => _$BillingToJson(this);
}
