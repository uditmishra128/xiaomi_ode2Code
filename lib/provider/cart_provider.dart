import 'package:flutter/cupertino.dart';
import 'package:xiomi_ode_to_code/model/item.dart';

class CartProvider extends ChangeNotifier {
  List<Item> _items = [];

  List<Item> get cartItems => _items;

  set cartItems(List<Item> i) {
    _items = i;
    notifyListeners();
  }
}
