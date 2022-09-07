import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xiomi_ode_to_code/provider/navigator.dart';
import 'package:xiomi_ode_to_code/screens/account/account.dart';
import 'package:xiomi_ode_to_code/screens/cart/cart.dart';
import 'package:xiomi_ode_to_code/screens/home/home.dart';
import 'package:xiomi_ode_to_code/screens/reports/reports.dart';
import 'package:xiomi_ode_to_code/utils/color.dart';

class DashBoardScreen extends StatefulWidget {
  static const String routeName = '/tutor/dash';
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  late PageController pageController;
  var currentTab = const [
    HomeScreen(),
    ReportScreen(),
    CartScreen(),
    AccountScreen(),
    AccountScreen()
  ];
  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final navigationModel = Provider.of<NavigationModel>(context);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: PageView(
          controller: pageController,
          onPageChanged: (index) {
            navigationModel.changePage = index;
          },
          physics: const NeverScrollableScrollPhysics(),
          children: [currentTab[navigationModel.currentIndex]],
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: navigationModel.currentIndex,
            onTap: (index) {
              navigationModel.changePage = index;
            },
            selectedItemColor: primary,
            unselectedItemColor: Colors.grey,
            backgroundColor: Colors.white,
            iconSize: 25.0,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.category),
                label: 'Category',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.text_snippet_outlined),
                label: 'Report',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                label: 'Home',
              ),
            ]),
      ),
    );
  }
}
