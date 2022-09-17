import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xiomi_ode_to_code/provider/cart_provider.dart';
import 'package:xiomi_ode_to_code/screens/payment/payment_loading.dart';
import 'package:xiomi_ode_to_code/screens/summary/order_tile.dart';
import 'package:xiomi_ode_to_code/utils/color.dart';
import 'package:xiomi_ode_to_code/widget/common/custom_btn.dart';

import 'check_out_field.dart';
import 'shippin_address.dart';

class Summary extends StatefulWidget {
  static const String routeName = '/order_summary';

  const Summary({Key? key}) : super(key: key);

  @override
  State<Summary> createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ShippingAddress(),
              const CheckOutFeild(
                fieldText: 'Order Summary',
              ),
              Flexible(
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: cartProvider.cartItems.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => OrderTile(
                    item: cartProvider.cartItems[index],
                  ),
                ),
              ),
              const SizedBox(
                height: 80,
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(12.0),
        child: CustomButton(
          title: 'Proceed To Payment',
          color: Colors.deepOrangeAccent,
          curve: 8,
          onTap: () {
            Navigator.pushNamed(context, PaymentLoading.routeName);
          },
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      leading: Container(
        margin: const EdgeInsets.all(7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: primary,
            width: 1,
          ),
        ),
        child: IconButton(
          icon: Icon(
            Icons.keyboard_arrow_left,
            size: 25,
            color: primary,
          ),
          onPressed: () {
            // do something
          },
        ),
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      title: const Text(
        'Check Out',
        style: TextStyle(
          color: Colors.black54,
          fontSize: 23,
        ),
      ),
      centerTitle: true,
    );
  }
}
