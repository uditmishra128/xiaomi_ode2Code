import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xiomi_ode_to_code/provider/cart_provider.dart';
import 'package:xiomi_ode_to_code/screens/customer_details/customer_details.dart';
import 'package:xiomi_ode_to_code/utils/constants.dart';
import 'package:xiomi_ode_to_code/utils/text_style.dart';
import 'package:xiomi_ode_to_code/widget/cart/cart_tile.dart';
import '../../widget/common/custom_btn.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    int subtotal = 0;
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    for (var i in cartProvider.cartItems) {
      subtotal += (i.itemCount * i.price!);
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: cartProvider.cartItems.isEmpty
            ? Center(
                child: Text(
                  'Nothing in cart',
                  style: bodyStyle1(context: context, size: 20),
                ),
              )
            : Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    child: CustomButton(
                      title:
                          'Proceed To Billing (${cartProvider.cartItems.length} item)',
                      color: Colors.deepOrangeAccent,
                      curve: 8,
                      onTap: () async {
                        Navigator.pushNamed(context, CustomerDetails.routeName);
                      },
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) => CartTile(
                        item: cartProvider.cartItems[index],
                        onCounterChange: (increment) {
                          if (increment) {
                            setState(() {
                              cartProvider.cartItems[index].itemCount++;
                            });
                          } else if (cartProvider.cartItems[index].itemCount >
                              1) {
                            setState(() {
                              cartProvider.cartItems[index].itemCount--;
                            });
                          }
                        },
                        onDlt: () {
                          setState(() {
                            cartProvider.cartItems
                                .remove(cartProvider.cartItems[index]);
                          });
                        },
                      ),
                      itemCount: cartProvider.cartItems.length,
                      shrinkWrap: true,
                    ),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                ],
              ),
      ),
      bottomSheet: cartProvider.cartItems.isNotEmpty
          ? Card(
              margin: const EdgeInsets.all(10.0),
              elevation: 3,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Subtotal',
                      style: bodyStyle2(context: context, size: 20),
                    ),
                    Text(
                      formatter.format(subtotal),
                      style: headingStyle1(context: context, size: 20),
                    ),
                  ],
                ),
              ),
            )
          : null,
    );
  }
}
