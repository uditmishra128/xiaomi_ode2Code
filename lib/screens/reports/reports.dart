import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xiomi_ode_to_code/model/bill.dart';
import 'package:xiomi_ode_to_code/provider/bill_provider.dart';
import 'package:xiomi_ode_to_code/screens/reports/reports_tile.dart';
import 'package:xiomi_ode_to_code/utils/locator.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  List<Bill> bills = [];
  @override
  void initState() {
    bills = Provider.of<BillProvider>(context, listen: false).bills;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reports'),
      ),
      body: ListView.builder(
          itemCount: bills.length,
          itemBuilder: (context, index) {
            return ReportTile(
              bill: bills[index],
            );
          }),
    );
  }
}
