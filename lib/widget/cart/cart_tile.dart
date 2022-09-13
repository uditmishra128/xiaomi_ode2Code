// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:xiomi_ode_to_code/utils/color.dart';
import 'package:xiomi_ode_to_code/utils/img_const.dart';

class CartTile extends StatelessWidget {
  const CartTile({Key? key}) : super(key: key);
  final int itemCount = 2;
  final int itemPrice = 100000;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 6,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: SizedBox(
                          width: 100.0,
                          height: 100.0,
                          child: Image(
                            image: AssetImage(logo),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Product Discription',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 20.0,
                                ),
                              ),
                              Text(
                                '₹ $itemPrice',
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0),
                              ),
                              const Text(
                                'In Stock',
                                style: const TextStyle(
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
                                    child: ProductQuantityButton(
                                      count: itemCount,
                                      price: itemPrice,
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
}

class ProductQuantityButton extends StatelessWidget {
  ProductQuantityButton({
    required this.count,
    required this.price,
    Key? key,
  }) : super(key: key);
  int count;
  int price;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: count > 1 ? Icons.remove : Icons.delete,
          onTap: () {
            if (count == 1) {
            } else {
              count--;
            }
          },
          iconBorderRadius:
              const BorderRadius.horizontal(left: Radius.circular(10)),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12.0),
          color: Colors.white,
          child: Text(
            '$count',
            style: const TextStyle(fontSize: 15.0),
          ),
        ),
        IconButton(
          icon: Icons.add,
          onTap: () {
            count++;
          },
          iconBorderRadius:
              const BorderRadius.horizontal(right: Radius.circular(10)),
        ),
      ],
    );
  }
}

class IconButton extends StatelessWidget {
  const IconButton({
    Key? key,
    required this.icon,
    required this.onTap,
    required this.iconBorderRadius,
  }) : super(key: key);
  final IconData icon;
  final BorderRadiusGeometry iconBorderRadius;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
}
