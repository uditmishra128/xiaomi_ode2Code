import 'package:flutter/material.dart';
import 'package:xiomi_ode_to_code/model/user.dart';
import 'package:xiomi_ode_to_code/utils/color.dart';
import 'package:xiomi_ode_to_code/utils/decoration.dart';
import 'package:xiomi_ode_to_code/utils/img_const.dart';
import 'package:xiomi_ode_to_code/utils/text_style.dart';
import 'package:xiomi_ode_to_code/utils/toast.dart';
import 'package:xiomi_ode_to_code/utils/validator.dart';
import 'package:xiomi_ode_to_code/widget/common/custom_btn.dart';
import 'package:xiomi_ode_to_code/widget/common/drop_down.dart';
import 'package:xiomi_ode_to_code/widget/common/form_field.dart';

class DetailsScreen extends StatefulWidget {
  static const String routeName = "/details";
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  GlobalKey<FormState> detailKey = GlobalKey<FormState>();
  AppUser appUser = AppUser.named();
  TextEditingController sNameController = TextEditingController();
  TextEditingController posIdController = TextEditingController();
  late FocusNode sName, sType, posId, btn;
  List<String> storeType = ["Mi Home", "Mi Store"];
  bool loading = false;
  @override
  void initState() {
    sName = FocusNode();
    sType = FocusNode();
    posId = FocusNode();
    btn = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    sName.dispose();
    sType.dispose();
    posId.dispose();
    btn.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: detailKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Image.asset(
                  logo,
                  height: 50,
                  width: 50,
                ),
              ),
              Text(
                'Store Details',
                style: headingStyle2(context: context, color: black1),
              ),

              // storeName
              const SizedBox(
                height: 20,
              ),
              CustomFormField(
                label: 'Store Name',
                focus: sName,
                hint: 'Enter name of your store',
                border: border4(Colors.black54, 8),
                validatorFn: commanValidator,
                textInputAction: TextInputAction.next,
                inputType: TextInputType.name,
                controller: sNameController,
                onChanged: (String val) {
                  setState(() {});
                },
                onFiledSubmitted: (String val) {
                  sName.unfocus();
                  FocusScope.of(context).requestFocus(sType);
                },
              ),

              //storeType
              const SizedBox(
                height: 20,
              ),
              CustomDropDown(
                label: 'Store Type',
                hint: 'Select your store type',
                border: border4(Colors.black54, 8),
                list: storeType.map((selected) {
                  return DropdownMenuItem(
                    value: selected,
                    child: Text(selected),
                  );
                }).toList(),
                onChanged: (val) {
                  setState(() {
                    appUser = appUser.copyWith(storeType: val);
                  });
                },
                selectedValue: appUser.storeType,
              ),
              // PosId
              const SizedBox(
                height: 20,
              ),
              CustomFormField(
                label: 'Point of Sales Id',
                focus: posId,
                hint: 'ID associated with machine type',
                border: border4(Colors.black54, 8),
                validatorFn: commanValidator,
                textInputAction: TextInputAction.next,
                inputType: TextInputType.name,
                controller: posIdController,
                onChanged: (String val) {
                  setState(() {});
                },
                onFiledSubmitted: (String val) {
                  sName.unfocus();
                  FocusScope.of(context).requestFocus(sType);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                title: 'Continue',
                color: secondary,
                loading: loading,
                onTap: () async {
                  FocusScope.of(context).requestFocus(FocusNode());
                  final form = detailKey.currentState;
                  if (form!.validate()) {
                  } else {
                    showFlagMsg(
                        context: context,
                        msg: 'Required fields are missing',
                        textColor: red);
                  }
                },
                curve: 12,
                focus: btn,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
