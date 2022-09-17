import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
import 'package:xiomi_ode_to_code/model/bill.dart';
import 'package:xiomi_ode_to_code/utils/toast.dart';
import 'package:dio/dio.dart';

class PaymentApiService {
  final dio = Dio();
  static String username = 'rzp_test_ITModCQTPVA7m4';
  static String password = 'EwObt94w5h2CbpBY9ldJ6Bnh';
  static String basicAuth =
      'Basic ${base64Encode(utf8.encode('$username:$password'))}';
  Future<String?> createPaymentLink(Bill bill) async {
    try {
      final response = await dio.post(
        'https://api.razorpay.com/v1/payment_links',
        options: Options(headers: {'authorization': basicAuth}),
        data: jsonEncode(<String, dynamic>{
          "amount": bill.totalAmount!.toInt() * 100,
          "currency": "INR",
          "customer": {
            "name": bill.customerName,
            "contact": '+91${bill.customerPhone}',
            "email": bill.customerEmail
          },
          "notify": {"sms": true, "email": true}
        }),
      );
      if (response.statusCode == 200) {
        var data = response.data;
        return data['id'];
      }
    } on Exception catch (e) {
      showToast(e.toString());
      return null;
    }
    return null;
  }

  Future<String> verifyPayment(String id) async {
    try {
      final response =
          await dio.get('https://api.razorpay.com/v1/payment_links/$id',
              options: Options(
                headers: {'authorization': basicAuth},
                contentType: Headers.jsonContentType,
              ));
      if (response.statusCode == 200) {
        var data = response.data;
        return data['status'];
      }
    } on Exception catch (e) {
      showToast(e.toString());
      return "";
    }
    return "";
  }

  Future<void> createBill(Bill bill) async {
    String id = const Uuid().v4();
    try {
      await FirebaseFirestore.instance
          .collection('bills')
          .doc(id)
          .set(bill.toJson());
    } catch (e) {
      showToast('Unknown error..');
    }
  }

  Future<List<Bill>> getBills() async {
    List<Bill> bills = [];
    try {
      QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection('bills').get();
      for (var element in snapshot.docs) {
        bills.add(Bill.fromJson(element.data()));
      }
      return bills;
    } catch (e) {
      showToast('Unknown error..');
    }
    return bills;
  }
}
