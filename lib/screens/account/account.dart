import 'package:flutter/material.dart';
import 'package:xiomi_ode_to_code/screens/product_discription/product_discription.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: ProductDescription(),
    );
  }
}
