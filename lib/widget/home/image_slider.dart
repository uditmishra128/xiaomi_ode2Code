import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:xiomi_ode_to_code/screens/home/search_screen.dart';
import 'package:xiomi_ode_to_code/utils/size.dart';
import 'package:xiomi_ode_to_code/widget/home/categories_row.dart';

class ImageSlider extends StatelessWidget {
  final int? curIndex;
  final Function(int, CarouselPageChangedReason)? onPageChange;
  const ImageSlider({Key? key, this.curIndex, this.onPageChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      'https://firebasestorage.googleapis.com/v0/b/xiomiodetocode.appspot.com/o/items%2Foffers_slider%2Fhome1.jpg?alt=media&token=e6c17966-2aa9-4629-b273-de6b045fc7dd',
      'https://firebasestorage.googleapis.com/v0/b/xiomiodetocode.appspot.com/o/items%2Foffers_slider%2Fhome2.jpg?alt=media&token=378ffb36-fd59-4113-87b5-52b1817af8ad',
      'https://firebasestorage.googleapis.com/v0/b/xiomiodetocode.appspot.com/o/items%2Foffers_slider%2Fhome3.jpg?alt=media&token=aef91eda-8e09-4016-964a-ae776274815d',
      'https://firebasestorage.googleapis.com/v0/b/xiomiodetocode.appspot.com/o/items%2Foffers_slider%2Fhome4.jpg?alt=media&token=9b14b8f5-a116-4f0c-87ab-cedaf4a4db32',
      'https://firebasestorage.googleapis.com/v0/b/xiomiodetocode.appspot.com/o/items%2Foffers_slider%2Fhome5.jpg?alt=media&token=41817881-02bc-42cd-bd83-574dd94111c0',
      'https://firebasestorage.googleapis.com/v0/b/xiomiodetocode.appspot.com/o/items%2Foffers_slider%2Fhome6.jpg?alt=media&token=49421aa5-0e01-4f46-a175-7272fe858bc9'
    ];

    return SizedBox(
      height: screenSize(context).height * .5,
      child: Stack(
        children: [
          CarouselSlider.builder(
              itemCount: imgList.length,
              itemBuilder: (context, index, realIndex) {
                final urlImage = imgList[index];
                return buildImage(urlImage, index);
              },
              options: CarouselOptions(
                autoPlay: true,
                onPageChanged: onPageChange,
                viewportFraction: 1,
                height: 350,
              )),
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
                        for (int i = 0; i < imgList.length; i++)
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

Widget buildImage(String urlImage, int index) {
  return Container(
    color: Colors.grey,
    child: CachedNetworkImage(
      imageUrl: urlImage,
      fit: BoxFit.cover,
    ),
  );
}

Widget pageIndicator(bool isCurrentPage) {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 150),
    margin: const EdgeInsets.symmetric(horizontal: 5.0),
    height: isCurrentPage ? 8.0 : 5.0,
    width: isCurrentPage ? 16.0 : 5.0,
    decoration: BoxDecoration(
      color: isCurrentPage ? Colors.grey : Colors.white,
      borderRadius: BorderRadius.circular(12),
    ),
  );
}
