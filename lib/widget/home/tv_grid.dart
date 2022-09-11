import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:xiomi_ode_to_code/model/item.dart';
import 'package:xiomi_ode_to_code/utils/img_const.dart';
import 'package:xiomi_ode_to_code/utils/text_style.dart';

class TVGrid extends StatelessWidget {
  const TVGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final item = Item(name: 'Xiomi 11i 5G', imgUrl: mobile, price: 11999);
    return Flexible(
      child: GridView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemCount: 6,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (context, index) =>
              buildTvCard(item: item, context: context)),
    );
  }

  Widget buildTvCard({Item? item, BuildContext? context}) {
    final item = Item(name: 'Xiomi 11i 5G', imgUrl: miTV, price: 11999);
    var formatter = NumberFormat('#,##,000');
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
              height: 150,
              child: Image.asset(
                item.imgUrl!,
                fit: BoxFit.fill,
              )),
          Text(
            item.name ?? "",
            style: bodyStyle1(context: context!, size: 12, color: Colors.black),
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
