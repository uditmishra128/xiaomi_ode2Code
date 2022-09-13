import 'package:flutter/material.dart';
import 'package:xiomi_ode_to_code/screens/reports/reports_tile.dart';
import 'package:xiomi_ode_to_code/screens/summary/order_tile.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reports'),
      ),
      body: Column(
        children: const [
          ReportTile(),
        ],
      ),
    );
  }
}
