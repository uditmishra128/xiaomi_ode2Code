import 'package:flutter/material.dart';
import 'package:xiomi_ode_to_code/screens/reports/reports_tile.dart';
import 'package:xiomi_ode_to_code/screens/summary/order_tile.dart';
import '../../utils/color.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({Key? key}) : super(key: key);
  final String customerName = 'Hari Kumar Juneja';
  final int itemCount = 2;
  final int totalPrice = 89647;
  final int serviceOrderNumber = 7586438967;
  final int invoiceNumber = 347348963;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(context: context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
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
              const SizedBox(
                height: 15,
              ),
              ReportTileDetails(
                firstText: 'Transaction',
                secondText: '₹ $totalPrice',
              ),
              const SizedBox(
                height: 8,
              ),
              ReportTileDetails(
                firstText: 'Service Order Number',
                secondText: '$serviceOrderNumber',
              ),
              const SizedBox(
                height: 8,
              ),
              ReportTileDetails(
                firstText: 'Invoice Number',
                secondText: '$invoiceNumber',
              ),
              const SizedBox(
                height: 8,
              ),
              const ReportTileDetails(
                firstText: 'Payment Method',
                secondText: 'Credit Card',
              ),
              const SizedBox(
                height: 8,
              ),
              Flexible(
                child: ListView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return const OrderTile();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

AppBar appBar({required BuildContext context}) {
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
          Navigator.pop(context);
        },
      ),
    ),
    elevation: 0,
    backgroundColor: Colors.white,
    title: const Text(
      'Order Details',
      style: TextStyle(
        color: Colors.black54,
        fontSize: 23,
      ),
    ),
    centerTitle: true,
  );
}
