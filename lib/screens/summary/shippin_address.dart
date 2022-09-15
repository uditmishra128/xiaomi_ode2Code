import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xiomi_ode_to_code/provider/bill_provider.dart';
import 'package:xiomi_ode_to_code/utils/color.dart';

import 'check_out_field.dart';

class ShippingAddress extends StatelessWidget {
  const ShippingAddress({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final billProvider = Provider.of<BillProvider>(context, listen: false);
    return Column(
      children: [
        const CheckOutFeild(
          fieldText: 'Shipping Address',
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(255, 235, 205, 1),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Icon(
                  Icons.location_on,
                  color: primary,
                  size: 18,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _customText(
                    billProvider.bill.customerName ?? "Customer name",
                  ),
                  _customText(
                    '+91 ${billProvider.bill.customerPhone ?? ' 889-995-xxxx'}',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  _customText(
                    billProvider.bill.customerAddress ??
                        'B/1, Nilkanth Chaya, 60 Feet Road, Ghatkopar,pant Nagar, Ghatkoper (east) Mumbai',
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}

_customText(String text) {
  return Text(
    text,
    style: const TextStyle(
      fontSize: 13,
    ),
  );
}
