import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

import '../model/item.dart';
import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';

List<Item> mobile = [
  Item(
      catId: 'mobilephonesmartphone',
      name: 'Redmi 1',
      price: 9899,
      imgUrl:
          'https://firebasestorage.googleapis.com/v0/b/xiomiodetocode.appspot.com/o/items%2Fmobiles%2Fmobile_1.jpg?alt=media&token=ba475ea8-5888-48e4-9cc5-9872618872c1'),
  Item(
      catId: 'mobilephonesmartphone',
      name: 'Redmi 2',
      price: 13999,
      imgUrl:
          'https://firebasestorage.googleapis.com/v0/b/xiomiodetocode.appspot.com/o/items%2Fmobiles%2Fmobile_2.jfif?alt=media&token=eab83501-9226-40d5-9cee-ad8a60d2a3fc'),
  Item(
      catId: 'mobilephonesmartphone',
      name: 'Redmi 3',
      price: 7499,
      imgUrl:
          'https://firebasestorage.googleapis.com/v0/b/xiomiodetocode.appspot.com/o/items%2Fmobiles%2Fmobile_3.jfif?alt=media&token=ad05498a-aea8-4bec-9860-30579b8c93a9'),
  Item(
      catId: 'mobilephonesmartphone',
      name: 'Redmi 4',
      price: 21399,
      imgUrl:
          'https://firebasestorage.googleapis.com/v0/b/xiomiodetocode.appspot.com/o/items%2Fmobiles%2Fmobile_4.jfif?alt=media&token=14b9d9c6-a5e1-4586-ab6c-eeb39f0407c6'),
  Item(
      catId: 'mobilephonesmartphone',
      name: 'Redmi 5',
      price: 17399,
      imgUrl:
          'https://firebasestorage.googleapis.com/v0/b/xiomiodetocode.appspot.com/o/items%2Fmobiles%2Fmobile_5.jfif?alt=media&token=1430cc86-09c2-4f74-8727-beaeae32ff64'),
  Item(
      catId: 'mobilephonesmartphone',
      name: 'Redmi 6',
      price: 27399,
      imgUrl:
          'https://firebasestorage.googleapis.com/v0/b/xiomiodetocode.appspot.com/o/items%2Fmobiles%2Fmobile_6.jfif?alt=media&token=7c849dea-b795-447b-9460-3c7c12729f05'),
  Item(
      catId: 'televisiontvsmarttvandroidtv',
      name: 'MI TV 1',
      price: 39899,
      imgUrl:
          'https://firebasestorage.googleapis.com/v0/b/xiomiodetocode.appspot.com/o/items%2Ftvs%2Ftv_1.jpg?alt=media&token=2667c78b-0007-48e8-a872-fc2481aab7f4'),
  Item(
      catId: 'televisiontvsmarttvandroidtv',
      name: 'MI TV 2',
      price: 123999,
      imgUrl:
          'https://firebasestorage.googleapis.com/v0/b/xiomiodetocode.appspot.com/o/items%2Ftvs%2Ftv_2.png?alt=media&token=de7e0c9e-23cf-4fcb-966b-ee918d55a721'),
  Item(
      catId: 'televisiontvsmarttvandroidtv',
      name: 'MI TV 3',
      price: 57499,
      imgUrl:
          'https://firebasestorage.googleapis.com/v0/b/xiomiodetocode.appspot.com/o/items%2Ftvs%2Ftv_3.jpg?alt=media&token=3b3ebff4-14f9-49d0-b381-736b7ced0608'),
  Item(
      catId: 'televisiontvsmarttvandroidtv',
      name: 'MI TV 4',
      price: 21399,
      imgUrl:
          'https://firebasestorage.googleapis.com/v0/b/xiomiodetocode.appspot.com/o/items%2Ftvs%2Ftv_4.jfif?alt=media&token=cf91c995-6733-4b76-9625-73c2b3679ad6'),
  Item(
      catId: 'televisiontvsmarttvandroidtv',
      name: 'MI TV 5',
      price: 87399,
      imgUrl:
          'https://firebasestorage.googleapis.com/v0/b/xiomiodetocode.appspot.com/o/items%2Ftvs%2Ftv_5.jfif?alt=media&token=950feab3-9d1c-498e-85b1-76244be6de84'),
  Item(
      catId: 'televisiontvsmarttvandroidtv',
      name: 'MI TV 6',
      price: 44399,
      imgUrl:
          'https://firebasestorage.googleapis.com/v0/b/xiomiodetocode.appspot.com/o/items%2Ftvs%2Ftv_6.png?alt=media&token=76cf2271-f624-4570-be28-332f6411c092'),
  Item(
      catId: 'laptopcomputersystem',
      name: 'MI Laptop 1',
      price: 39899,
      imgUrl:
          'https://firebasestorage.googleapis.com/v0/b/xiomiodetocode.appspot.com/o/items%2Flaptops%2Flaptop_1.jfif?alt=media&token=5a06032b-1e87-4d76-86cd-b967ff3d2c49'),
  Item(
      catId: 'laptopcomputersystem',
      name: 'MI Laptop 2',
      price: 132999,
      imgUrl:
          'https://firebasestorage.googleapis.com/v0/b/xiomiodetocode.appspot.com/o/items%2Flaptops%2Flaptop_2.jfif?alt=media&token=4373af35-26f2-46f9-8e09-f4d5a10670bb'),
  Item(
      catId: 'laptopcomputersystem',
      name: 'MI Laptop 3',
      price: 67499,
      imgUrl:
          'https://firebasestorage.googleapis.com/v0/b/xiomiodetocode.appspot.com/o/items%2Flaptops%2Flaptop_3.jfif?alt=media&token=580d6d7f-9517-438c-b01c-6b0f15c7df26'),
  Item(
      catId: 'laptopcomputersystem',
      name: 'MI Laptop 4',
      price: 45399,
      imgUrl:
          'https://firebasestorage.googleapis.com/v0/b/xiomiodetocode.appspot.com/o/items%2Flaptops%2Flaptop_4.jfif?alt=media&token=18105ae4-4ade-46aa-a36f-c3419dfd689a'),
  Item(
      catId: 'laptopcomputersystem',
      name: 'MI Laptop 5',
      price: 97399,
      imgUrl:
          'https://firebasestorage.googleapis.com/v0/b/xiomiodetocode.appspot.com/o/items%2Flaptops%2Flaptop_5.jfif?alt=media&token=1ad10408-08bf-4e9c-bd5e-daa45d8a67e0'),
  Item(
      catId: 'laptopcomputersystem',
      name: 'MI Laptop 6',
      price: 77399,
      imgUrl:
          'https://firebasestorage.googleapis.com/v0/b/xiomiodetocode.appspot.com/o/items%2Flaptops%2Flaptop_6.jfif?alt=media&token=786fbb98-4021-4ea7-b162-dde38330812d'),
  Item(
      catId: 'assistant',
      name: 'MI Home Item 1',
      price: 3899,
      imgUrl:
          'https://firebasestorage.googleapis.com/v0/b/xiomiodetocode.appspot.com/o/items%2Fhome%2Fhome_1.jfif?alt=media&token=dce1c3ff-18f8-4253-818b-6f88e0ee405f'),
  Item(
      catId: 'assistant',
      name: 'MI Home Item 2',
      price: 12999,
      imgUrl:
          'https://firebasestorage.googleapis.com/v0/b/xiomiodetocode.appspot.com/o/items%2Fhome%2Fhome_2.jfif?alt=media&token=3f8f8f7b-5963-4706-9cc0-b58db77b6114'),
  Item(
      catId: 'assistant',
      name: 'MI Home Item 3',
      price: 6499,
      imgUrl:
          'https://firebasestorage.googleapis.com/v0/b/xiomiodetocode.appspot.com/o/items%2Fhome%2Fhome_3.jfif?alt=media&token=1333e846-cd18-47f0-9bf4-a8b4b3b33c8d'),
  Item(
      catId: 'assistant',
      name: 'MI Home Item 4',
      price: 5399,
      imgUrl:
          'https://firebasestorage.googleapis.com/v0/b/xiomiodetocode.appspot.com/o/items%2Fhome%2Fhome_4.jfif?alt=media&token=75907656-5a5d-45ee-9e78-9cf34d15d084'),
  Item(
      catId: 'assistant',
      name: 'MI Home Item 5',
      price: 9399,
      imgUrl:
          'https://firebasestorage.googleapis.com/v0/b/xiomiodetocode.appspot.com/o/items%2Fhome%2Fhome_5.jfif?alt=media&token=fc535da9-aef6-4e5a-a8e6-2d1ae5e18d5c'),
  Item(
      catId: 'watchfitness',
      name: 'MI Fitness 1',
      price: 3899,
      imgUrl:
          'https://firebasestorage.googleapis.com/v0/b/xiomiodetocode.appspot.com/o/items%2Ffitness%2Fwatch_1.jfif?alt=media&token=bae1c7c4-c3fe-4dde-8f40-3ae58bbe5c11'),
  Item(
      catId: 'watchfitness',
      name: 'MI Fitness 2',
      price: 2999,
      imgUrl:
          'https://firebasestorage.googleapis.com/v0/b/xiomiodetocode.appspot.com/o/items%2Ffitness%2Fwatch_2.jfif?alt=media&token=2f3717a5-6655-4110-9270-c43d3036d0c8'),
  Item(
      catId: 'watchfitness',
      name: 'MI Fitness 3',
      price: 6499,
      imgUrl:
          'https://firebasestorage.googleapis.com/v0/b/xiomiodetocode.appspot.com/o/items%2Ffitness%2Fwatch_3.jfif?alt=media&token=fd9851ad-2766-4bb1-806e-0c3f96970415'),
  Item(
      catId: 'watchfitness',
      name: 'MI Fitness 4',
      price: 5399,
      imgUrl:
          'https://firebasestorage.googleapis.com/v0/b/xiomiodetocode.appspot.com/o/items%2Ffitness%2Fwatch_4.jfif?alt=media&token=00ddd8a6-6bdb-414a-96aa-aaa75b1cda90'),
  Item(
      catId: 'watchfitness',
      name: 'MI Fitness 5',
      price: 3399,
      imgUrl:
          'https://firebasestorage.googleapis.com/v0/b/xiomiodetocode.appspot.com/o/items%2Ffitness%2Fwatch_5.jfif?alt=media&token=3ee0f28f-64bd-46d6-833e-0fbf515a1fce'),
  Item(
      catId: 'speakersheadphonewirelessearphone',
      name: 'MI Audio 1',
      price: 899,
      imgUrl:
          'https://firebasestorage.googleapis.com/v0/b/xiomiodetocode.appspot.com/o/items%2Faudio%2Faudio_1.jfif?alt=media&token=3892baae-2fe0-4743-8f99-71a7cc573a5b'),
  Item(
      catId: 'speakersheadphonewirelessearphone',
      name: 'MI Audio 2',
      price: 4299,
      imgUrl:
          'https://firebasestorage.googleapis.com/v0/b/xiomiodetocode.appspot.com/o/items%2Faudio%2Faudio_2.jfif?alt=media&token=584c6131-7b8b-46c9-bf03-e76982dcbd03'),
  Item(
      catId: 'speakersheadphonewirelessearphone',
      name: 'MI Audio 3',
      price: 449,
      imgUrl:
          'https://firebasestorage.googleapis.com/v0/b/xiomiodetocode.appspot.com/o/items%2Faudio%2Faudio_3.jfif?alt=media&token=d366c718-fb28-459d-877a-7be7d8a3e165'),
  Item(
      catId: 'speakersheadphonewirelessearphone',
      name: 'MI Audio 4',
      price: 599,
      imgUrl:
          'https://firebasestorage.googleapis.com/v0/b/xiomiodetocode.appspot.com/o/items%2Faudio%2Faudio_4.jfif?alt=media&token=cc2bd0c2-fc8e-4391-b1a6-c602fac1c024'),
  Item(
      catId: 'speakersheadphonewirelessearphone',
      name: 'MI Audio 5',
      price: 1359,
      imgUrl:
          'https://firebasestorage.googleapis.com/v0/b/xiomiodetocode.appspot.com/o/items%2Faudio%2Faudio_5.jfif?alt=media&token=e9b5afb6-211f-4a13-8091-a0892d2de323'),
  Item(
      catId: 'speakersheadphonewirelessearphone',
      name: 'MI Audio 6',
      price: 1119,
      imgUrl:
          'https://firebasestorage.googleapis.com/v0/b/xiomiodetocode.appspot.com/o/items%2Faudio%2Faudio_6.png?alt=media&token=30a01f2f-72ad-4c50-990d-5cde74aea509'),
  Item(
      catId: 'speakersheadphonewirelessearphone',
      name: 'MI Audio 7',
      price: 3359,
      imgUrl:
          'https://firebasestorage.googleapis.com/v0/b/xiomiodetocode.appspot.com/o/items%2Faudio%2Faudio_7.jfif?alt=media&token=bfb155ce-942a-438b-b8b8-ef4f5dcb5eca'),
];

Future<File> getImageFileFromAssets(String path) async {
  final byteData = await rootBundle.load('assets/$path');

  final file = File('${(await getTemporaryDirectory()).path}/$path');
  await file.writeAsBytes(byteData.buffer
      .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

  return file;
}

Future createItem() async {
  for (int i = 0; i < mobile.length; i++) {
    String id = const Uuid().v4();
    await FirebaseFirestore.instance
        .collection('items')
        .doc(id)
        .set(mobile[i].toJson());
  }
}
