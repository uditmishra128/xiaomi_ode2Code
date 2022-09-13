import 'package:flutter/material.dart';
import 'package:xiomi_ode_to_code/screens/summary/order_tile.dart';
import 'package:xiomi_ode_to_code/utils/color.dart';
import 'package:xiomi_ode_to_code/widget/common/custom_btn.dart';

import 'check_out_field.dart';
import 'shippin_address.dart';

class Summary extends StatelessWidget {
  const Summary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ShippingAddress(),
            const CheckOutFeild(
              fieldText: 'Order Summary',
            ),
            Flexible(
              child: ListView.builder(
                itemCount: 6,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return const OrderTile();
                },
              ),
            ),
            const SizedBox(
              height: 80,
            ),
          ],
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(12.0),
        child: CustomButton(
          title: 'Proceed To Billing',
          color: Colors.deepOrangeAccent,
          curve: 8,
          onTap: () {},
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
