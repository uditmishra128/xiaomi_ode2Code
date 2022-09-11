import 'package:flutter/material.dart';
import 'package:xiomi_ode_to_code/utils/img_const.dart';
import 'package:xiomi_ode_to_code/utils/size.dart';
import 'package:xiomi_ode_to_code/utils/text_style.dart';
import 'package:xiomi_ode_to_code/widget/home/mobile_row.dart';
import 'package:xiomi_ode_to_code/widget/home/slider.dart';
import 'package:xiomi_ode_to_code/widget/home/tv_grid.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int curIndex = 0;
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ImageSlider(
            curIndex: curIndex,
            onPageChange: (index, _) => setState(() {
              curIndex = index;
            }),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15),
            height: 200,
            width: screenSize(context).width * .9,
            child: Image.asset(
              diwaliGif,
              fit: BoxFit.fill,
            ),
          ),

          //mobiles
          _title('Smart Phones'),
          const MobileRow(),

          // tvs
          _title('Smart Tvs'),
          const TVGrid(),
        ],
      ),
    );
  }

  Widget _title(String title) => Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: headingStyle1(
              context: context,
            ),
          ),
        ),
      );
}
