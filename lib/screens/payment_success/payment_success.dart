import 'package:flutter/material.dart';
import 'package:xiomi_ode_to_code/utils/color.dart';

import 'package:xiomi_ode_to_code/utils/size.dart';
import 'package:xiomi_ode_to_code/widget/common/custom_btn.dart';

class PaymentSuccess extends StatelessWidget {
  const PaymentSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CircleAvatar(
            radius: screenSize(context).width / 2.3,
            child: Icon(
              Icons.check,
              color: primary,
              size: 250,
            ),
          ),
          Text(
            'Payment Successful',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,
              color: black1,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      bottomSheet: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: screenSize(context).width,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: CustomButton(
                title: 'Send Recipt via Whatsapp',
                color: const Color.fromARGB(255, 23, 173, 28),
                curve: 8,
                onTap: () {},
              ),
            ),
          ),
          SizedBox(
            width: screenSize(context).width,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: CustomButton(
                title: 'Send Recipt via Email',
                color: const Color.fromARGB(255, 253, 103, 97),
                curve: 8,
                onTap: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
