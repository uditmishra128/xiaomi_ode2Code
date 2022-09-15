import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:xiomi_ode_to_code/utils/color.dart';
import 'package:xiomi_ode_to_code/utils/loader.dart';

class ImageSlider extends StatelessWidget {
  final List<String> imgList;
  final bool autoPlay;
  final Function(int, CarouselPageChangedReason)? onPageChange;
  const ImageSlider(
      {Key? key,
      this.imgList = const [],
      this.onPageChange,
      this.autoPlay = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: imgList.length,
        itemBuilder: (context, index, realIndex) {
          final urlImage = imgList[index];
          return buildImage(urlImage, index, context);
        },
        options: CarouselOptions(
          autoPlay: autoPlay,
          onPageChanged: onPageChange,
          viewportFraction: 1,
          height: 350,
        ));
  }
}

Widget buildImage(String urlImage, int index, BuildContext context) {
  return Container(
    color: Colors.white,
    child: CachedNetworkImage(
      progressIndicatorBuilder: (context, url, progress) =>
          Center(child: spinKit(color: primary)),
      imageUrl: urlImage,
      fit: BoxFit.cover,
    ),
  );
}
