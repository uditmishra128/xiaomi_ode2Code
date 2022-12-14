import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:xiomi_ode_to_code/handler/items.dart';
import 'package:xiomi_ode_to_code/screens/home/search_screen.dart';
import 'package:xiomi_ode_to_code/utils/color.dart';
import 'package:xiomi_ode_to_code/utils/constants.dart';
import 'package:xiomi_ode_to_code/utils/decoration.dart';
import 'package:xiomi_ode_to_code/utils/img_const.dart';
import 'package:xiomi_ode_to_code/utils/text_style.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text(
          'Category',
          style: headingStyle1(context: context, size: 20),
        ),
        actions: [
          IconButton(
            iconSize: 25,
            color: black1,
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                  context,
                  PageTransition(
                      child: const SearchScreen(),
                      type: PageTransitionType.rightToLeft));
            },
          ),
        ],
      ),
      body: GridView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemCount: homeCatIcon.length,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (context, index) => buildCategoryCard(
              context: context,
              gradient: gradientColor(index: index),
              iconData: homeCatIcon[index],
              cat: category[index],
              onTap: () {
                navigateToCategory(category[index], context);
              })),
    );
  }

  Widget buildCategoryCard(
      {required BuildContext context,
      Gradient? gradient,
      IconData? iconData,
      String? cat,
      Function()? onTap}) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          splashColor: Colors.white.withOpacity(.5),
          onTap: onTap,
          child: Ink(
            width: 40,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                gradient: gradient, borderRadius: BorderRadius.circular(5)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Icon(
                    iconData,
                    color: Colors.white,
                    size: 35,
                  ),
                ),
                Text(
                  cat!,
                  style: headingStyle1(
                      context: context, color: Colors.white, size: 20),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
