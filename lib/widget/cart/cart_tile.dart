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
                        Text(
                          '₹ $itemPrice',
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0),
                        ),
                        const Text(
                          'In Stock',
                          style: TextStyle(
                            fontSize: 13.0,
                            color: Colors.green,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Card(
                              elevation: 1,
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    color: Colors.black45, width: 1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: productQuantityButton(
                                count: itemCount,
                                price: itemPrice,
                              ),
                            ),
                            Card(
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    color: Colors.black45, width: 1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              elevation: 2,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 7, horizontal: 11.0),
                                child: Text(
                                  'Delete',
                                  style:
                                      TextStyle(color: black1, fontSize: 12.0),
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
    );
  }
}

Widget productQuantityButton({
  required int count,
  required int price,
  Key? key,
}) {
  return Row(
    children: [
      counterBtn(
        icon: Icons.add,
        onTap: () {
          if (count > 1) {
            count--;
          }
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
        onTap: () => count++,
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
