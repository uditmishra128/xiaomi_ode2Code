import 'package:flutter/material.dart';
import 'package:xiomi_ode_to_code/widget/cart/cart_tile.dart';

import '../../utils/color.dart';
import '../../widget/common/custom_btn.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int totalItemCount = 1;
  int subtotal = 10000;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              child: CustomButton(
                title: 'Proceed To Billing ($totalItemCount item)',
                color: Colors.deepOrangeAccent,
                curve: 8,
                onTap: () async {},
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => const CartTile(),
                itemCount: 8,
                shrinkWrap: true,
              ),
            ),
            const SizedBox(
              height: 80,
            ),
          ],
        ),
      ),
      bottomSheet: Card(
        margin: const EdgeInsets.all(10.0),
        elevation: 3,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Text(
                'Subtotal',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                ),
              ),
              Text(
                '₹ 10000',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
