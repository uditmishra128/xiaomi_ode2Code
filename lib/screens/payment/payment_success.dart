import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xiomi_ode_to_code/provider/navigator.dart';
import 'package:xiomi_ode_to_code/screens/dash.dart';
import 'package:xiomi_ode_to_code/utils/constants.dart';
import 'package:xiomi_ode_to_code/utils/img_const.dart';
import 'package:xiomi_ode_to_code/utils/text_style.dart';
import 'package:lottie/lottie.dart';

class PaymentSuccess extends StatefulWidget {
  static const String routeName = '/successPayment';
  const PaymentSuccess({Key? key}) : super(key: key);

  @override
  State<PaymentSuccess> createState() => _PaymentSuccessState();
}

class _PaymentSuccessState extends State<PaymentSuccess> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final navigationModel =
          Provider.of<NavigationModel>(context, listen: false);
      navigationModel.changePage = 2;
    });
    successRoute();
    super.initState();
  }

  successRoute() {
    Future.delayed(const Duration(seconds: 8), () {
      Navigator.pushNamedAndRemoveUntil(
          context, DashBoardScreen.routeName, (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Lottie.asset(
            success,
          ),
          Text(
            'Payment Successful',
            textAlign: TextAlign.center,
            style: headingStyle1(context: context),
          ),
          Text(
            successPayment,
            textAlign: TextAlign.center,
            style: bodyStyle2(context: context, size: 16),
          ),
        ],
      ),
    );
  }
}
