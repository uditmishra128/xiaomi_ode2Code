import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:xiomi_ode_to_code/screens/home/search_screen.dart';
import 'package:xiomi_ode_to_code/utils/img_const.dart';
import 'package:xiomi_ode_to_code/utils/page_indicator.dart';
import 'package:xiomi_ode_to_code/utils/size.dart';
import 'package:xiomi_ode_to_code/widget/common/image_slider.dart';
import 'package:xiomi_ode_to_code/widget/home/categories_row.dart';

class HomeSlider extends StatelessWidget {
  final int? curIndex;
  final Function(int, CarouselPageChangedReason)? onPageChange;
  const HomeSlider({Key? key, this.curIndex, this.onPageChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenSize(context).height * .5,
      child: Stack(
        children: [
          ImageSlider(
            imgList: imgListHome,
            onPageChange: onPageChange,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              padding: const EdgeInsets.only(top: 25, left: 10),
              iconSize: 25,
              color: Colors.white,
              icon: const Icon(Icons.search),
              onPressed: () {
                Navigator.push(
                    context,
                    PageTransition(
                        child: const SearchScreen(),
                        type: PageTransitionType.rightToLeft));
              },
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int i = 0; i < imgListHome.length; i++)
                          i == curIndex
                              ? pageIndicator(true)
                              : pageIndicator(false),
                      ],
                    ),
                  ),
                  const CategoriesRow(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
