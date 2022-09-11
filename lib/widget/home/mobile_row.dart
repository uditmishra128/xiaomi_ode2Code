import 'package:flutter/material.dart';
import 'package:xiomi_ode_to_code/model/item.dart';
import 'package:xiomi_ode_to_code/utils/img_const.dart';
import 'package:intl/intl.dart';
import 'package:xiomi_ode_to_code/utils/text_style.dart';

class MobileRow extends StatelessWidget {
  const MobileRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final item = Item(name: 'Xiomi 11i 5G', imgUrl: mobile, price: 11999);
    return SizedBox(
      height: 110,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 8,
          itemBuilder: (context, index) =>
              buildMobile(item: item, context: context)),
    );
  }

  Widget buildMobile({Item? item, required BuildContext context}) {
    var formatter = NumberFormat('#,##,000');
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        children: [
          SizedBox(
              height: 60,
              child: Image.asset(
                item!.imgUrl!,
                fit: BoxFit.fill,
              )),
          Text(
            item.name ?? "",
            style: bodyStyle1(context: context, size: 12, color: Colors.black),
          ),
          Text(
            formatter.format(item.price),
            style: bodyStyle1(context: context, size: 12, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
