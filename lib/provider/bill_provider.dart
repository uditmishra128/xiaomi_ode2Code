import 'package:flutter/cupertino.dart';
import 'package:xiomi_ode_to_code/model/bill.dart';

class BillProvider extends ChangeNotifier {
  Bill _bill = Bill();

  Bill get bill => _bill;

  set bill(Bill bill) {
    _bill = bill;
    notifyListeners();
  }

  List<Bill> _bills = [];

  List<Bill> get bills => _bills;

  set changebills(List<Bill> i) {
    _bills = i;
    notifyListeners();
  }
}
