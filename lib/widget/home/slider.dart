import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
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
      'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
      'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
      'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
      'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
      'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
      'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
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
              onPressed: () {},
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
    child: Image.network(
      urlImage,
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
