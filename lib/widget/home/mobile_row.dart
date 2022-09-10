import 'package:flutter/material.dart';
import 'package:xiomi_ode_to_code/model/item.dart';
import 'package:xiomi_ode_to_code/utils/img_const.dart';
import 'package:intl/intl.dart';

class MobileRow extends StatelessWidget {
  const MobileRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formatter = NumberFormat('#,##,000');
    final item = Item(name: 'Xiomi 11i 5G', imgUrl: mobile, price: 11999);
    return SizedBox(
      height: 500,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 8,
          itemBuilder: (context, index) => buildMobile()),
    );
  }

  Widget buildMobile({Item? item}) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
              height: 50,
              child: Image.asset(
                mobile,
                fit: BoxFit.fill,
              )),
// Text()
        ],
      );
}
