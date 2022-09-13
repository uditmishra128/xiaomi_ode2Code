import 'package:flutter/material.dart';
import 'package:xiomi_ode_to_code/utils/color.dart';
import 'package:xiomi_ode_to_code/utils/img_const.dart';
import 'package:xiomi_ode_to_code/utils/size.dart';
import 'package:xiomi_ode_to_code/utils/text_style.dart';

class ProductDescription extends StatefulWidget {
  static const String routeName = '/product_desc';
  const ProductDescription({Key? key}) : super(key: key);

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                miTV,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 1, horizontal: 14),
                child: Text(
                  'Product Name',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 0.5, horizontal: 14),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'From ₹',
                      style: TextStyle(fontSize: 14, color: primary),
                    ),
                    Text(
                      '24599 ',
                      style: headingStyle1(
                          context: context, color: primary, size: 19),
                    ),
                    const Text(
                      '₹29899',
                      style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        fontSize: 15,
                        color: Colors.black26,
                      ),
                    ),
                  ],
                ),
              ),
              SelectionCard(
                selectionCardChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Up to ₹6,000 Instant Discount* with ICICI Bank Credit Card, Credit & Debit Card EMI',
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 12.0,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'No Cost EMI Available',
                      style: TextStyle(
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
              ),
              SelectionCard(
                selectionCardChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        for (int i = 1; i <= 3; i++)
                          specificationText(
                            size: '${32 * i} Inch',
                          ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        for (int i = 1; i <= 3; i++)
                          specificationText(
                            size: 'Color $i',
                          )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomSheet: SizedBox(
          width: screenSize(context).width,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 3,
            color: Colors.deepOrangeAccent,
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Buy Now',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ));
  }
}

Widget specificationText({
  required String size,
}) {
  return Text(
    size,
    style: const TextStyle(
      fontSize: 13.0,
    ),
  );
}

class SelectionCard extends StatelessWidget {
  const SelectionCard({Key? key, required this.selectionCardChild})
      : super(key: key);
  final Widget selectionCardChild;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 12),
      child: GestureDetector(
        child: Card(
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.black12, width: 1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: selectionCardChild,
          ),
        ),
      ),
    );
  }
}
