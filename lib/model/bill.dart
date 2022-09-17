import 'package:json_annotation/json_annotation.dart';
import 'package:xiomi_ode_to_code/model/item.dart';
part 'bill.g.dart';

enum PaymentMethod { online, cash }

enum ModeOFComm { whatsapp, email }

@JsonSerializable(explicitToJson: true)
class Bill {
  final String? customerName;
  final String? customerPhone;
  final String? customerEmail;
  final String? customerAddress;
  final ModeOFComm? modeOfComm;
  final String? operatorId;
  final String? storeName;
  final String? invoice;
  final double? totalAmount;
  final double? taxAmount;
  final PaymentMethod? paymentMethod;
  final String? serviceOrderNumber;
  final List<Item>? items;
  Bill(
      {this.customerName,
      this.customerPhone,
      this.customerEmail,
      this.customerAddress,
      this.modeOfComm,
      this.operatorId,
      this.storeName,
      this.invoice,
      this.totalAmount,
      this.taxAmount,
      this.paymentMethod,
      this.serviceOrderNumber,
      this.items});
  Bill.named(
      {this.customerName,
      this.customerPhone,
      this.customerEmail,
      this.customerAddress,
      this.modeOfComm,
      this.operatorId,
      this.storeName,
      this.invoice,
      this.totalAmount,
      this.taxAmount,
      this.paymentMethod,
      this.serviceOrderNumber,
      this.items});
  Bill copyWith({
    final String? customerName,
    final String? customerPhone,
    final String? customerEmail,
    final String? customerAddress,
    final ModeOFComm? modeOfComm,
    final String? operatorId,
    final String? storeName,
    final String? invoice,
    final double? totalAmount,
    final double? taxAmount,
    final PaymentMethod? paymentMethod,
    final String? serviceOrderNumber,
    final List<Item>? items,
  }) =>
      Bill.named(
          customerName: customerName ?? this.customerName,
          customerPhone: customerPhone ?? this.customerPhone,
          customerEmail: customerEmail ?? this.customerEmail,
          customerAddress: customerAddress ?? this.customerAddress,
          modeOfComm: modeOfComm ?? this.modeOfComm,
          operatorId: operatorId ?? this.operatorId,
          storeName: storeName ?? this.storeName,
          invoice: invoice ?? this.invoice,
          totalAmount: totalAmount ?? this.totalAmount,
          taxAmount: taxAmount ?? this.taxAmount,
          paymentMethod: paymentMethod ?? this.paymentMethod,
          serviceOrderNumber: serviceOrderNumber ?? this.serviceOrderNumber,
          items: items ?? this.items);
  factory Bill.fromJson(json) => _$BillFromJson(json);

  Map<String, dynamic> toJson() => _$BillToJson(this);
}
