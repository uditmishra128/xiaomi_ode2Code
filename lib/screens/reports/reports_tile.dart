// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:xiomi_ode_to_code/screens/reports/order_details.dart';

class ReportTile extends StatelessWidget {
  const ReportTile({Key? key}) : super(key: key);
  final String customerName = 'Hari Kumar Juneja';
  final int itemCount = 2;
  final int totalPrice = 89647;
  final int serviceOrderNumber = 7586438967;
  final int invoiceNumber = 347348963;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const OrderDetails()));
        },
        child: Card(
          elevation: 6,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                customerName,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 19.0),
                              ),
                              const Text(
                                '12-09-2022',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13.0),
                              ),
                            ],
                          ),
                        ),
                        ReportTileDetails(
                          firstText: 'Transaction',
                          secondText: '₹ $totalPrice',
                        ),
                        ReportTileDetails(
                          firstText: 'Service Order Number',
                          secondText: '$serviceOrderNumber',
                        ),
                        ReportTileDetails(
                          firstText: 'Invoice Number',
                          secondText: '$invoiceNumber',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ReportTileDetails extends StatelessWidget {
  const ReportTileDetails({
    Key? key,
    required this.firstText,
    required this.secondText,
  }) : super(key: key);

  final String firstText;
  final String secondText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            firstText,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 16.0,
            ),
          ),
          Text(
            secondText,
            style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 15.0),
          ),
        ],
      ),
    );
  }
}
