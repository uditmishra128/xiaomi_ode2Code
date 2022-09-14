import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xiomi_ode_to_code/model/item.dart';
import 'package:xiomi_ode_to_code/provider/cart_provider.dart';
import 'package:xiomi_ode_to_code/provider/navigator.dart';
import 'package:xiomi_ode_to_code/screens/dash.dart';
import 'package:xiomi_ode_to_code/utils/color.dart';
import 'package:xiomi_ode_to_code/utils/constants.dart';
import 'package:xiomi_ode_to_code/utils/img_const.dart';
import 'package:xiomi_ode_to_code/utils/page_indicator.dart';
import 'package:xiomi_ode_to_code/utils/size.dart';
import 'package:xiomi_ode_to_code/utils/text_style.dart';
import 'package:xiomi_ode_to_code/widget/common/custom_btn.dart';
import 'package:xiomi_ode_to_code/widget/common/image_slider.dart';

class ProductDescription extends StatefulWidget {
  final Item item;
  static const String routeName = '/product_desc';
  const ProductDescription({Key? key, required this.item}) : super(key: key);

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  int curIndex = 0;
  late NavigationModel navigator;
  late CartProvider cartProvider;
  final List<String> _imgList = [];
  bool alreadyAdded = false;
  @override
  void initState() {
    cartProvider = Provider.of<CartProvider>(context, listen: false);
    navigator = Provider.of<NavigationModel>(context, listen: false);
    setState(() {
      alreadyAdded = cartProvider.cartItems
              .firstWhere(
                  (element) => element.productId == widget.item.productId,
                  orElse: () => Item())
              .productId !=
          null;
    });
    if (widget.item.imgUrl != null) _imgList.add(widget.item.imgUrl!);
    _imgList.addAll(productDescImageList);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 380,
              child: ImageSlider(
                autoPlay: false,
                imgList: _imgList,
                onPageChange: (index, _) {
                  setState(() {
                    curIndex = index;
                  });
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < imgListHome.length; i++)
                  i == curIndex ? pageIndicator(true) : pageIndicator(false),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 14),
              child: Text(
                widget.item.name ?? 'Product Name',
                style: headingStyle1(context: context, size: 20),
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
                    formatter.format(widget.item.price),
                    style: headingStyle1(
                        context: context, color: primary, size: 19),
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
              selectionCardChild: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (int i = 1; i <= 3; i++)
                    specificationText(
                      size: '${32 * i} Inch\nColor $i',
                      index: i,
                    ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 0.5, horizontal: 14),
              child: Text(description),
            ),
            const SizedBox(
              height: 80,
            ),
          ],
        ),
      ),
      bottomSheet: SizedBox(
        width: screenSize(context).width,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: CustomButton(
            title: alreadyAdded ? 'Already Added to cart' : 'Add to Cart',
            color: alreadyAdded ? secondary : primary,
            curve: 8,
            onTap: () {
              if (!alreadyAdded) {
                widget.item.itemCount++;
                cartProvider.cartItems.add(widget.item);
                navigator.changePage = 3;
                Navigator.pushNamed(context, DashBoardScreen.routeName);
              }
            },
          ),
        ),
      ),
    );
  }
}

Widget specificationText({
  required String size,
  int? index,
}) {
  return Row(
    children: [
      Radio(value: true, groupValue: index == 1, onChanged: (_) {}),
      Text(
        size,
        style: const TextStyle(
          fontSize: 13.0,
        ),
      ),
    ],
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
