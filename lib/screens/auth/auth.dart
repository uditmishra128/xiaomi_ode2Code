import 'package:flutter/material.dart';
import 'package:xiomi_ode_to_code/screens/auth/sign_in.dart';
import 'package:xiomi_ode_to_code/screens/auth/sign_up.dart';
import 'package:xiomi_ode_to_code/utils/color.dart';
import 'package:xiomi_ode_to_code/utils/img_const.dart';
import 'package:xiomi_ode_to_code/utils/size.dart';
import 'package:xiomi_ode_to_code/utils/text_style.dart';

class LoginRegisterScreen extends StatefulWidget {
  static String routeName = "/login";
  const LoginRegisterScreen({Key? key}) : super(key: key);

  @override
  State<LoginRegisterScreen> createState() => _LoginRegisterScreenState();
}

class _LoginRegisterScreenState extends State<LoginRegisterScreen> {
  bool login = true;

  setLogin(bool signIn) {
    setState(() {
      login = signIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              height: screenSize(context).height / 3.4,
              width: screenSize(context).width,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(authImg), fit: BoxFit.fill)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Text(
                    !login ? 'Welcome' : 'Welcome back',
                    style: bodyStyle1(
                        context: context, color: Colors.white, size: 28),
                  ),
                  Text(
                    !login ? 'Sign Up' : 'Sign In',
                    style: headingStyle1(
                        context: context, color: Colors.white, size: 32),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            login ? const SignIn() : const SignUp(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  !login ? 'Already a user?' : 'Don\'t have account?',
                  style: bodyStyle1(context: context, size: 16),
                ),
                TextButton(
                    onPressed: () {
                      setState(() {
                        login = !login;
                      });
                    },
                    child: Text(
                      !login ? 'Sign In' : ' Sign Up',
                      style: headingStyle1(
                          context: context, color: primary, size: 15),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
