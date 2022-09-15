import 'package:flutter/cupertino.dart';
import 'package:xiomi_ode_to_code/model/bill.dart';

class BillProvider extends ChangeNotifier {
  Bill _bill = Bill();

  Bill get bill => _bill;

  set bill(Bill bill) {
    _bill = bill;
    notifyListeners();
  }
}
