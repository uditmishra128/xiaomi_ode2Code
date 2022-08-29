import 'package:flutter/material.dart';
import 'package:xiomi_ode_to_code/screens/splash/auth/auth.dart';
import 'package:xiomi_ode_to_code/screens/splash/splash.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  LoginRegisterScreen.routeName: (context) => const LoginRegisterScreen(),
};