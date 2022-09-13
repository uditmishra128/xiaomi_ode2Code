import 'package:flutter/material.dart';
import 'package:xiomi_ode_to_code/utils/color.dart';

import 'check_out_field.dart';

class ShippingAddress extends StatelessWidget {
  const ShippingAddress({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                children: const [
                  AddressText(
                    text: 'Customer Name',
                  ),
                  AddressText(
                    text: '+91 889-995-2244',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AddressText(
                    text:
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

class AddressText extends StatelessWidget {
  const AddressText({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 13,
      ),
    );
  }
}
