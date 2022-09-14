import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:xiomi_ode_to_code/model/item.dart';
import 'package:xiomi_ode_to_code/utils/constants.dart';
import 'package:xiomi_ode_to_code/screens/product_discription/product_discription.dart';
import 'package:xiomi_ode_to_code/utils/text_style.dart';

class MobileRow extends StatelessWidget {
  final List<Item> mobiles;
  const MobileRow({
    Key? key,
    this.mobiles = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 110,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: mobiles.length,
          itemBuilder: (context, index) => buildMobile(
              item: mobiles[index],
              context: context,
              onTap: () {
                Navigator.pushNamed(context, ProductDescription.routeName,
                    arguments: mobiles[index]);
              }),
        ));
  }

  Widget buildMobile(
      {required Item item, required BuildContext context, Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Column(
          children: [
            SizedBox(
                height: 60,
                child: CachedNetworkImage(
                  imageUrl: item.imgUrl!,
                  fit: BoxFit.fill,
                )),
            Text(
              item.name ?? "",
              style:
                  bodyStyle1(context: context, size: 12, color: Colors.black),
            ),
            Text(
              '₹ ${formatter.format(item.price)}',
              style:
                  bodyStyle1(context: context, size: 12, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
