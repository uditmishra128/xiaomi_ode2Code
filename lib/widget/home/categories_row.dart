import 'package:flutter/material.dart';
import 'package:xiomi_ode_to_code/utils/decoration.dart';
import 'package:xiomi_ode_to_code/utils/img_const.dart';

class CategoriesRow extends StatelessWidget {
  const CategoriesRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SizedBox(
        height: 70,
        child: Card(
          child: ListView.builder(
              itemCount: homeCatIcon.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return buildCatItem(
                  gradient: gradientColor(index: index),
                  iconData: homeCatIcon[index],
                );
              }),
        ),
      ),
    );
  }

  Widget buildCatItem({Gradient? gradient, IconData? iconData}) {
    return Container(
      width: 45,
      margin: const EdgeInsets.all(6),
      decoration: BoxDecoration(
          gradient: gradient, borderRadius: BorderRadius.circular(5)),
      padding: const EdgeInsets.all(5),
      child: Icon(
        iconData,
        color: Colors.white,
        size: 22,
      ),
    );
  }
}
