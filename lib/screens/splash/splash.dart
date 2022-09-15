import 'package:flutter/material.dart';
import 'package:xiomi_ode_to_code/screens/dash.dart';
import 'package:xiomi_ode_to_code/utils/img_const.dart';
import 'package:xiomi_ode_to_code/utils/size.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "/splash";
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2),
        () => Navigator.pushNamed(context, DashBoardScreen.routeName));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
          height: screenSize(context).height,
          width: screenSize(context).width,
          child: Center(
            child: Image.asset(
              logo,
              height: 80,
              width: 80,
            ),
          )),
    );
  }
}
