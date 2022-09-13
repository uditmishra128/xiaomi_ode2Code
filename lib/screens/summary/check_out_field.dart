import 'package:flutter/material.dart';
import 'package:xiomi_ode_to_code/utils/color.dart';

class CheckOutFeild extends StatelessWidget {
  const CheckOutFeild({
    Key? key,
    required this.fieldText,
  }) : super(key: key);
  final String fieldText;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          fieldText,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: const Color.fromRGBO(255, 235, 205, 1),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: const Color.fromRGBO(255, 235, 205, 1),
              width: 1,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 18),
            child: Text(
              'Edit',
              style: TextStyle(
                fontSize: 14,
                color: primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
