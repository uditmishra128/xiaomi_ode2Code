import 'package:flutter/material.dart';
import 'package:xiomi_ode_to_code/widget/home/slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int curIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        ImageSlider(
          curIndex: curIndex,
          onPageChange: (index, _) => setState(() {
            curIndex = index;
            print(index);
          }),
        ),
      ]),
    );
  }
}
