import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:xiomi_ode_to_code/model/item.dart';
import 'package:xiomi_ode_to_code/utils/toast.dart';

class ItemServices {
  Future<List<Item>> getItems() async {
    List<Item> items = [];
    try {
      QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection('items').get();
      for (var element in snapshot.docs) {
        items.add(Item.fromJson(element.data()));
      }
      return items;
    } catch (e) {
      showToast('Something wents worong');
      return [];
    }
  }
}
