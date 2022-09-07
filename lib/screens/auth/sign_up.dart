import 'dart:async';

import 'package:flutter/material.dart';
import 'package:xiomi_ode_to_code/handler/auth.dart';
import 'package:xiomi_ode_to_code/utils/color.dart';
import 'package:xiomi_ode_to_code/utils/decoration.dart';
import 'package:xiomi_ode_to_code/utils/toast.dart';
import 'package:xiomi_ode_to_code/utils/validator.dart';
import 'package:xiomi_ode_to_code/widget/common/custom_btn.dart';
import 'package:xiomi_ode_to_code/widget/common/form_field.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late FocusNode email, password, confirmPassword, signUp;
  GlobalKey<FormState> signUpKey = GlobalKey<FormState>();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  bool obscurePass = true;
  bool loading = false;

  @override
  void initState() {
    email = FocusNode();
    password = FocusNode();
    confirmPassword = FocusNode();
    signUp = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    confirmPassword.dispose();
    signUp.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: signUpKey,
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
              obscure: obscurePass,
              hint: 'Enter your password',
              border: border4(Colors.black54, 8),
              textInputAction: TextInputAction.done,
              inputType: TextInputType.text,
              controller: passController,
              suffix: IconButton(
                onPressed: () {
                  setState(() {
                    obscurePass = !obscurePass;
                  });
                },
                icon: Icon(
                  Icons.remove_red_eye,
                  color: obscurePass ? blueBerry3 : blueBerry4.withOpacity(0.3),
                  size: 25.0,
                ),
              ),
              onChanged: (String val) {
                setState(() {});
              },
              onFiledSubmitted: (String val) {
                password.unfocus();
                FocusScope.of(context).requestFocus(confirmPassword);
              },
            ),
            // Confirm Password
            const SizedBox(
              height: 20,
            ),
            CustomFormField(
              labelTxt: 'Confirm Password',
              focus: confirmPassword,
              obscure: obscurePass,
              hint: 'Enter password again',
              border: border4(Colors.black54, 8),
              validatorFn: (String? value) {
                if (value!.isNotEmpty && value != passController.text) {
                  return "Password doesn't match";
                }
                return null;
              },
              textInputAction: TextInputAction.done,
              inputType: TextInputType.text,
              controller: confirmPassController,
              onChanged: (String val) {
                setState(() {});
              },
              onFiledSubmitted: (String val) {
                confirmPassword.unfocus();
                FocusScope.of(context).requestFocus(signUp);
              },
            ),

            // register
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              title: 'Sign Up',
              color: secondary,
              loading: loading,
              onTap: emailController.text.isEmpty ||
                      passController.text.isEmpty ||
                      confirmPassController.text.isEmpty
                  ? null
                  : () async {
                      FocusScope.of(context).requestFocus(FocusNode());
                      final form = signUpKey.currentState;
                      if (form!.validate()) {
                        form.save();
                        setState(() {
                          loading = true;
                        });
                        bool success = await registerUser(
                            email: emailController.text,
                            password: passController.text,
                            context: context);
                        if (success) {
                          Navigator;
                        } else {
                          showFlagMsg(
                              context: context,
                              msg: 'Unable to register user, Please try again!',
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
              focus: signUp,
            ),
          ],
        ),
      ),
    );
  }
}
