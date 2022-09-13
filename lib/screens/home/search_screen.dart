import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:xiomi_ode_to_code/model/item.dart';
import 'package:xiomi_ode_to_code/provider/item_provider.dart';
import 'package:xiomi_ode_to_code/utils/color.dart';
import 'package:xiomi_ode_to_code/utils/decoration.dart';
import 'package:xiomi_ode_to_code/utils/text_style.dart';
import 'package:xiomi_ode_to_code/widget/common/form_field.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = '/search_screen';
  final String? catId;
  const SearchScreen({Key? key, this.catId}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Item> _items = [];
  late ItemsProvider itemsProvider;
  String query = '';
  void _search(String query) {
    final filterItem = itemsProvider.items.where((item) {
      final catLower = item.catId!.toLowerCase();
      final searchLower = query.toLowerCase();
      return catLower.contains(searchLower);
    }).toList();
    setState(() {
      // this.query = query;
      _items = filterItem;
    });
  }

  @override
  void initState() {
    itemsProvider = Provider.of<ItemsProvider>(context, listen: false);
    _items = widget.catId != null
        ? itemsProvider.items
            .where((element) => element.catId == widget.catId)
            .toList()
        : itemsProvider.items;
    searchController.addListener(() {
      _search(searchController.text);
    });
    super.initState();
  }

  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const SizedBox(height: 25),
        Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                color: black1,
                icon: const Icon(
                  Icons.arrow_back,
                )),
            Flexible(
              child: CustomFormField(
                hint: 'Search',
                fillColor: grey1,
                contentPadding: EdgeInsets.zero,
                border: border4(Colors.white, 8),
                controller: searchController,
                onChanged: (String val) {
                  setState(() {});
                },
                textInputAction: TextInputAction.next,
                inputType: TextInputType.emailAddress,
                prefix: const Icon(Icons.search),
                onFiledSubmitted: (String val) {},
              ),
            ),
            const SizedBox(width: 15),
          ],
        ),

        //items list
        const SizedBox(height: 10),
        Flexible(
          child: GridView.builder(
              padding: EdgeInsets.zero,
              itemCount: _items.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) => _buildItem(
                    item: _items[index],
                    context: context,
                  )),
        )
      ]),
    );
  }

  Widget _buildItem(
      {required Item item, required BuildContext context, Function()? onTap}) {
    var formatter = NumberFormat('#,##,000');
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Column(
          children: [
            SizedBox(
                height: 100,
                width: 100,
                child: CachedNetworkImage(
                  imageUrl: item.imgUrl!,
                )),
            Text(
              item.name ?? "",
              style:
                  bodyStyle1(context: context, size: 15, color: Colors.black),
            ),
            Text(
              '₹ ${formatter.format(item.price)}',
              style: bodyStyle1(context: context, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
