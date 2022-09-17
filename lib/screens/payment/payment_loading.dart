import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:xiomi_ode_to_code/provider/bill_provider.dart';
import 'package:xiomi_ode_to_code/screens/payment/payment_success.dart';
import 'package:xiomi_ode_to_code/utils/constants.dart';
import 'package:xiomi_ode_to_code/utils/img_const.dart';
import 'package:xiomi_ode_to_code/utils/locator.dart';
import 'package:xiomi_ode_to_code/utils/text_style.dart';

class PaymentLoading extends StatefulWidget {
  static const String routeName = 'paymentLoading';
  const PaymentLoading({Key? key}) : super(key: key);

  @override
  State<PaymentLoading> createState() => _PaymentLoadingState();
}

class _PaymentLoadingState extends State<PaymentLoading> {
  String? paymentId;
  String success = '';
  Timer? _timer;
  @override
  void initState() {
    initPaymnet();
    super.initState();
  }

  initPaymnet() async {
    final billProvider = Provider.of<BillProvider>(context, listen: false);
    paymentId = await payServ.createPaymentLink(billProvider.bill);
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) async {
      if (success == 'paid') {
        payServ.createBill(billProvider.bill);
        Navigator.pushNamed(context, PaymentSuccess.routeName);
      } else if (paymentId != null) {
        success = await payServ.verifyPayment(paymentId!);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            paymentLoading,
            repeat: true,
          ),
          Text(
            loadingPayment,
            textAlign: TextAlign.center,
            style: bodyStyle2(context: context, size: 16),
          ),
        ],
      ),
    );
  }
}
