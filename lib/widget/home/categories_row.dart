import 'package:flutter/material.dart';
import 'package:xiomi_ode_to_code/handler/items.dart';
import 'package:xiomi_ode_to_code/utils/constants.dart';
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
                    onTap: () {
                      navigateToCategory(category[index], context);
                    });
              }),
        ),
      ),
    );
  }

  Widget buildCatItem(
      {Gradient? gradient, IconData? iconData, Function()? onTap}) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: InkWell(
        splashColor: Colors.white.withOpacity(.5),
        onTap: onTap,
        child: Ink(
          width: 45,
          decoration: BoxDecoration(
              gradient: gradient, borderRadius: BorderRadius.circular(5)),
          padding: const EdgeInsets.all(5),
          child: Icon(
            iconData,
            color: Colors.white,
            size: 22,
          ),
        ),
      ),
    );
  }
}
