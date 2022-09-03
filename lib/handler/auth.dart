import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xiomi_ode_to_code/provider/auth.dart';
import 'package:xiomi_ode_to_code/screens/splash/auth/auth.dart';
import 'package:xiomi_ode_to_code/screens/splash/auth/details.dart';
import 'package:xiomi_ode_to_code/services/auth.dart';
import 'package:xiomi_ode_to_code/utils/locator.dart';

getRoute({required BuildContext context}) async {
  final firebaseUser = await locator.get<AuthService>().currentFirebaseUser();
  if (firebaseUser == null) {
    // ignore: use_build_context_synchronously
    Navigator.pushNamed(context, LoginRegisterScreen.routeName);
  } else {
    // ignore: use_build_context_synchronously
    Navigator.pushNamed(context, DetailsScreen.routeName);
  }
}

// Register user with email/pass
Future<bool> registerUser(
    {required String email,
    required String password,
    required BuildContext context}) async {
  var authProvider = Provider.of<AuthProvider>(context, listen: false);
  String? uid =
      await authProvider.registerWithEmailAndPassword(email, password);
  if (uid != null) {
    return true;
  } else {
    return false;
  }
}

// Login user with email/pass
Future<bool> logInUser(
    {required String email,
    required String password,
    required BuildContext context}) async {
  var authProvider = Provider.of<AuthProvider>(context, listen: false);
  return await authProvider.signInWithEmailAndPassword(
      uEmail: email, password: password);
}
