import 'package:flutter/material.dart';
import 'package:xiomi_ode_to_code/model/item.dart';

class ItemsProvider extends ChangeNotifier {
  List<Item> _items = [];

  List<Item> get items => _items;

  set changeItems(List<Item> i) {
    _items = i;
    notifyListeners();
  }
}
