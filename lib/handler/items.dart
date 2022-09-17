import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:xiomi_ode_to_code/model/bill.dart';
import 'package:xiomi_ode_to_code/model/item.dart';
import 'package:xiomi_ode_to_code/provider/bill_provider.dart';
import 'package:xiomi_ode_to_code/provider/item_provider.dart';
import 'package:xiomi_ode_to_code/screens/home/search_screen.dart';
import 'package:xiomi_ode_to_code/utils/locator.dart';

Future<void> getAllItems({required BuildContext context}) async {
  final itemProvider = Provider.of<ItemsProvider>(context, listen: false);
  List<Item> items = await itemServ.getItems();
  itemProvider.changeItems = items;
}

Future<void> getAllBills({required BuildContext context}) async {
  final itemProvider = Provider.of<BillProvider>(context, listen: false);
  List<Bill> items = await payServ.getBills();
  itemProvider.changebills = items;
}

navigateToCategory(String category, BuildContext context) {
  switch (category) {
    case 'Smartphones':
      Navigator.pushNamed(context, SearchScreen.routeName,
          arguments: 'mobilephonesmartphone');
      break;
    case 'SmartTvs':
      Navigator.pushNamed(context, SearchScreen.routeName,
          arguments: 'televisiontvsmarttvandroidtv');
      break;
    case 'Laptops':
      Navigator.pushNamed(context, SearchScreen.routeName,
          arguments: 'laptopcomputersystem');
      break;
    case 'Wireless Earphone':
      Navigator.pushNamed(context, SearchScreen.routeName,
          arguments: 'speakersheadphonewirelessearphone');
      break;
    case 'Fitness':
      Navigator.pushNamed(context, SearchScreen.routeName,
          arguments: 'watchfitness');
      break;
    case 'Assistant Home':
      Navigator.pushNamed(context, SearchScreen.routeName,
          arguments: 'assistant');
      break;
    default:
      Navigator.pushNamed(context, SearchScreen.routeName);
      break;
  }
}

int getRandom() {
  var rnd = Random();
  var next = rnd.nextDouble() * 1000000;
  while (next < 100000) {
    next *= 10;
  }
  return next.toInt();
}
