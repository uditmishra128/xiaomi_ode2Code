import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:xiomi_ode_to_code/model/item.dart';
import 'package:xiomi_ode_to_code/utils/color.dart';
import 'package:xiomi_ode_to_code/utils/constants.dart';
import 'package:xiomi_ode_to_code/utils/text_style.dart';

class CartTile extends StatelessWidget {
  final Item? item;
  final Function(bool) onCounterChange;
  final Function()? onDlt;
  const CartTile(
      {Key? key, required this.item, required this.onCounterChange, this.onDlt})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            color: Colors.white,
            elevation: 8.0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SizedBox(
                          width: 100.0,
                          height: 100.0,
                          child: CachedNetworkImage(imageUrl: item!.imgUrl!),
                        ),
                      ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item!.name ?? " ",
                                overflow: TextOverflow.ellipsis,
                                style: bodyStyle2(
                                    context: context, color: black1, size: 20),
                              ),
                              Text(
                                '₹ ${formatter.format(item?.price)}',
                                style:
                                    headingStyle1(context: context, size: 20),
                              ),
                              const Text(
                                'In Stock',
                                style: TextStyle(
                                  fontSize: 13.0,
                                  color: Colors.green,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Card(
                                    elevation: 1,
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                          color: Colors.black45, width: 1),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: productQuantityButton(
                                      count: item?.itemCount ?? 0,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        side: const BorderSide(
                                            color: Colors.black45, width: 1),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      elevation: 2,
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 7, horizontal: 11.0),
                                        child: Text(
                                          'Delete',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget productQuantityButton({
    required int count,
    Key? key,
  }) {
    return Row(
      children: [
        counterBtn(
          icon: Icons.remove,
          onTap: () {
            onCounterChange(false);
          },
          iconBorderRadius:
              const BorderRadius.horizontal(right: Radius.circular(10)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12.0),
          child: Text(
            '$count',
            style: const TextStyle(fontSize: 15.0),
          ),
        ),
        counterBtn(
          icon: Icons.add,
          onTap: () {
            onCounterChange(true);
          },
          iconBorderRadius:
              const BorderRadius.horizontal(right: Radius.circular(10)),
        )
      ],
    );
  }

  Widget counterBtn({
    Key? key,
    IconData? icon,
    Function()? onTap,
    BorderRadiusGeometry? iconBorderRadius,
  }) =>
      GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          decoration: BoxDecoration(
            borderRadius: iconBorderRadius,
            color: greyBG,
          ),
          child: Icon(
            icon,
            size: 16.0,
          ),
        ),
      );
}
