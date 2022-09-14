import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xiomi_ode_to_code/model/item.dart';
import 'package:xiomi_ode_to_code/provider/item_provider.dart';
import 'package:xiomi_ode_to_code/utils/img_const.dart';
import 'package:xiomi_ode_to_code/utils/size.dart';
import 'package:xiomi_ode_to_code/utils/text_style.dart';
import 'package:xiomi_ode_to_code/widget/home/mobile_row.dart';
import 'package:xiomi_ode_to_code/widget/home/home_slider.dart';
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
    final itemsProvider = Provider.of<ItemsProvider>(context);
    List<Item> mobiles = itemsProvider.items
        .where((element) => element.catId == 'mobilephonesmartphone')
        .toList();
    List<Item> tvs = itemsProvider.items
        .where((element) => element.catId == 'televisiontvsmarttvandroidtv')
        .toList();

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          HomeSlider(
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
          MobileRow(
            mobiles: mobiles,
          ),

          // tvs
          _title('Smart Tvs'),
          TVGrid(
            tvs: tvs,
          ),
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
