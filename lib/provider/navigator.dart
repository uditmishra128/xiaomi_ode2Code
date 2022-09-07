import 'package:flutter/material.dart';

class NavigationModel extends ChangeNotifier {
  int _pageIndex = 0;
  get currentIndex => _pageIndex;

  set changePage(int i) {
    _pageIndex = i;
    notifyListeners();
  }
}
