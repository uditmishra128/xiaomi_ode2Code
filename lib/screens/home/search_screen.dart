import 'package:flutter/material.dart';
import 'package:xiomi_ode_to_code/utils/color.dart';
import 'package:xiomi_ode_to_code/utils/decoration.dart';
import 'package:xiomi_ode_to_code/widget/common/form_field.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = '/search_screen';
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
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
      ]),
    );
  }
}
