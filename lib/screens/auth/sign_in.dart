import 'dart:async';

import 'package:flutter/material.dart';
import 'package:xiomi_ode_to_code/handler/auth.dart';
import 'package:xiomi_ode_to_code/utils/color.dart';
import 'package:xiomi_ode_to_code/utils/decoration.dart';
import 'package:xiomi_ode_to_code/utils/text_style.dart';
import 'package:xiomi_ode_to_code/utils/toast.dart';
import 'package:xiomi_ode_to_code/utils/validator.dart';
import 'package:xiomi_ode_to_code/widget/common/custom_btn.dart';
import 'package:xiomi_ode_to_code/widget/common/form_field.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late FocusNode email, password, signIn;
  GlobalKey<FormState> signInKey = GlobalKey<FormState>();
  TextEditingController passController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  bool obscure = true;
  bool loading = false;

  @override
  void initState() {
    email = FocusNode();
    password = FocusNode();
    signIn = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    signIn.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: signInKey,
        child: Column(
          children: [
            // email
            const SizedBox(
              height: 20,
            ),
            CustomFormField(
              labelTxt: 'Email',
              focus: email,
              hint: 'Enter your email address',
              border: border4(Colors.black54, 8),
              validatorFn: emailValidator,
              controller: emailController,
              onChanged: (String val) {
                setState(() {});
              },
              textInputAction: TextInputAction.next,
              inputType: TextInputType.emailAddress,
              onFiledSubmitted: (String val) {
                email.unfocus();
                FocusScope.of(context).requestFocus(password);
              },
            ),

            // password
            const SizedBox(
              height: 20,
            ),
            CustomFormField(
              labelTxt: 'Password',
              focus: password,
              obscure: obscure,
              hint: 'Enter your password',
              border: border4(Colors.black54, 8),
              textInputAction: TextInputAction.done,
              inputType: TextInputType.text,
              controller: passController,
              suffix: IconButton(
                onPressed: () {
                  setState(() {
                    obscure = !obscure;
                  });
                },
                icon: Icon(
                  Icons.remove_red_eye,
                  color: obscure ? blueBerry3 : blueBerry4.withOpacity(0.3),
                  size: 25.0,
                ),
              ),
              counter: InkWell(
                onTap: () {
                  // resetPasswordBtmSheet(context);
                },
                child: Text('Forget Password?',
                    style: headingStyle1(
                        context: context, size: 14, color: primary)),
              ),
              onChanged: (String val) {
                setState(() {});
              },
              onFiledSubmitted: (String val) {
                password.unfocus();
                FocusScope.of(context).requestFocus(signIn);
              },
            ),

            // register
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              title: 'Sign In',
              color: secondary,
              loading: loading,
              onTap: emailController.text.isEmpty || passController.text.isEmpty
                  ? null
                  : () async {
                      FocusScope.of(context).requestFocus(FocusNode());
                      final form = signInKey.currentState;
                      if (form!.validate()) {
                        form.save();
                        setState(() {
                          loading = true;
                        });
                        bool success = await logInUser(
                            email: emailController.text,
                            password: passController.text,
                            context: context);
                        if (success) {
                          debugPrint('Success!');
                          await getRoute(context: context);
                        } else {
                          showFlagMsg(
                              context: context,
                              msg: 'Unable to login, Please try again!',
                              textColor: red);
                          Timer(const Duration(seconds: 2), () {
                            setState(() {
                              loading = false;
                            });
                          });
                        }
                      } else {
                        showFlagMsg(
                            context: context,
                            msg: 'Required fields are missing',
                            textColor: red);
                      }
                    },
              curve: 12,
              focus: signIn,
            ),
          ],
        ),
      ),
    );
  }
}
