import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:xiomi_ode_to_code/model/item.dart';
import 'package:xiomi_ode_to_code/screens/auth/auth.dart';
import 'package:xiomi_ode_to_code/screens/auth/details.dart';
import 'package:xiomi_ode_to_code/screens/customer_details/customer_details.dart';
import 'package:xiomi_ode_to_code/screens/dash.dart';
import 'package:xiomi_ode_to_code/screens/home/search_screen.dart';
import 'package:xiomi_ode_to_code/screens/product_discription/product_discription.dart';
import 'package:xiomi_ode_to_code/screens/splash/splash.dart';
import 'package:xiomi_ode_to_code/screens/summary/summary.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    String path = settings.name!;
    final argument = settings.arguments;
    switch (path) {
      case SplashScreen.routeName:
        return PageTransition(
            child: const SplashScreen(),
            settings: settings,
            type: PageTransitionType.fade);
      case LoginRegisterScreen.routeName:
        return PageTransition(
            child: const LoginRegisterScreen(),
            settings: settings,
            type: PageTransitionType.fade);
      case DetailsScreen.routeName:
        return PageTransition(
            child: const DetailsScreen(),
            settings: settings,
            type: PageTransitionType.fade);
      case DashBoardScreen.routeName:
        return PageTransition(
            child: const DashBoardScreen(),
            settings: settings,
            type: PageTransitionType.fade);
      case SearchScreen.routeName:
        return PageTransition(
            child: SearchScreen(
              catId: argument as String,
            ),
            settings: settings,
            type: PageTransitionType.rightToLeft);
      case ProductDescription.routeName:
        return PageTransition(
            child: ProductDescription(
              item: argument as Item,
            ),
            settings: settings,
            type: PageTransitionType.fade);
      case Summary.routeName:
        return PageTransition(
            child: const Summary(),
            settings: settings,
            type: PageTransitionType.fade);
      case CustomerDetails.routeName:
        return PageTransition(
            child: const CustomerDetails(),
            settings: settings,
            type: PageTransitionType.fade);
      default:
        return PageTransition(
            child: const SplashScreen(),
            settings: settings,
            type: PageTransitionType.fade);
    }
  }
}
