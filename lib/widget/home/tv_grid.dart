import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:xiomi_ode_to_code/utils/constants.dart';
import 'package:xiomi_ode_to_code/model/item.dart';
import 'package:xiomi_ode_to_code/screens/product_discription/product_discription.dart';
import 'package:xiomi_ode_to_code/utils/text_style.dart';

class TVGrid extends StatelessWidget {
  final List<Item> tvs;
  const TVGrid({Key? key, this.tvs = const []}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: GridView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemCount: tvs.length,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (context, index) => buildTvCard(
              item: tvs[index],
              context: context,
              onTap: () {
                Navigator.pushNamed(context, ProductDescription.routeName,
                    arguments: tvs[index]);
              })),
    );
  }

  Widget buildTvCard(
      {required Item item, BuildContext? context, Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 120,
            child: CachedNetworkImage(
              imageUrl: item.imgUrl!,
              fit: BoxFit.fill,
            ),
          ),
          Text(
            item.name ?? "",
            style: bodyStyle1(context: context!, size: 12, color: Colors.black),
          ),
          Text(
            '₹ ${formatter.format(item.price)}',
            style: bodyStyle1(context: context, size: 12, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
