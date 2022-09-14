import 'package:flutter/material.dart';
import 'package:xiomi_ode_to_code/utils/color.dart';
import 'package:xiomi_ode_to_code/utils/decoration.dart';
import 'package:xiomi_ode_to_code/utils/size.dart';
import 'package:xiomi_ode_to_code/utils/text_style.dart';
import 'package:xiomi_ode_to_code/utils/validator.dart';
import 'package:xiomi_ode_to_code/widget/common/custom_btn.dart';
import 'package:xiomi_ode_to_code/widget/common/form_field.dart';

class CustomerDetails extends StatefulWidget {
  const CustomerDetails({Key? key}) : super(key: key);

  @override
  State<CustomerDetails> createState() => _CustomerDetailsState();
}

class _CustomerDetailsState extends State<CustomerDetails> {
  String selectedCommunication = 'Whatsapp';
  late String cName, phoneNo, emailAddress, communicationChoice, address;
  late FocusNode name, phone, email, deliveryAddress;
  GlobalKey<FormState> customerDetailsKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  bool loading = false;

  @override
  void initState() {
    name = FocusNode();
    phone = FocusNode();
    email = FocusNode();
    deliveryAddress = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    name.dispose();
    phone.dispose();
    email.dispose();
    deliveryAddress.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Form(
              key: customerDetailsKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //operator id
                  Text(
                    'Operator Id',
                    style: headingStyle1(
                        context: context, size: 15, color: txtColor),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: screenSize(context).width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.black54,
                        width: 1,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        '6487865434',
                        style: bodyStyle1(
                            context: context, size: 18, color: txtColor),
                      ),
                    ),
                  ),

                  //name
                  const SizedBox(
                    height: 20,
                  ),
                  CustomFormField(
                    label: 'Customer Name',
                    focus: name,
                    hint: 'Enter Customer Name',
                    border: border4(Colors.black54, 8),
                    onChanged: (String val) {
                      setState(() {
                        cName = val;
                      });
                    },
                    validatorFn: nameValidator,
                    textInputAction: TextInputAction.next,
                    inputType: TextInputType.text,
                    onFiledSubmitted: (String val) {
                      name.unfocus();
                      FocusScope.of(context).requestFocus(phone);
                    },
                  ),

                  // phone
                  const SizedBox(
                    height: 20,
                  ),
                  CustomFormField(
                    label: 'Phone Number',
                    focus: phone,
                    hint: 'Enter Customer Phone Number',
                    border: border4(Colors.black54, 8),
                    validatorFn: phoneValidator,
                    controller: phoneController,
                    onChanged: (String val) {
                      setState(() {
                        phoneNo = val;
                      });
                    },
                    textInputAction: TextInputAction.next,
                    inputType: TextInputType.number,
                    onFiledSubmitted: (String val) {
                      phone.unfocus();
                      FocusScope.of(context).requestFocus(email);
                    },
                  ),
                  // email
                  const SizedBox(
                    height: 20,
                  ),
                  CustomFormField(
                    label: 'Email',
                    focus: email,
                    hint: 'Enter Customer Email Address',
                    border: border4(Colors.black54, 8),
                    validatorFn: emailValidator,
                    controller: emailController,
                    onChanged: (String val) {
                      setState(() {
                        emailAddress = val;
                      });
                    },
                    textInputAction: TextInputAction.next,
                    inputType: TextInputType.emailAddress,
                    onFiledSubmitted: (String val) {
                      email.unfocus();
                      FocusScope.of(context).requestFocus(deliveryAddress);
                    },
                  ),

                  // address
                  const SizedBox(
                    height: 20,
                  ),
                  CustomFormField(
                    maxLine: 3,
                    label: 'Address',
                    focus: deliveryAddress,
                    hint: 'Enter Customer Address',
                    border: border4(Colors.black54, 8),
                    validatorFn: commanValidator,
                    onChanged: (String val) {
                      setState(() {
                        address = val;
                      });
                    },
                    textInputAction: TextInputAction.next,
                    inputType: TextInputType.text,
                    onFiledSubmitted: (String val) {
                      deliveryAddress.unfocus();
                    },
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  // choice of communication
                  Text(
                    'Enter choice of Business Communication',
                    style: headingStyle1(
                        context: context, size: 15, color: txtColor),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      communicationTile(
                        const Radius.circular(200),
                        Radius.zero,
                        selectedCommunication == 'Whatsapp'
                            ? Colors.green
                            : Colors.black26,
                        Icons.whatsapp,
                        'Whatsapp',
                        () {
                          setState(() {
                            selectedCommunication = 'Whatsapp';
                          });
                        },
                      ),
                      communicationTile(
                        Radius.zero,
                        const Radius.circular(200),
                        selectedCommunication == 'Email'
                            ? Colors.blueAccent
                            : Colors.black26,
                        Icons.email,
                        'Email',
                        () {
                          setState(() {
                            selectedCommunication = 'Email';
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomButton(
                    title: 'Continue',
                    color: Colors.deepOrangeAccent,
                    curve: 8,
                    onTap: () async {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  GestureDetector communicationTile(Radius leftRadius, Radius rightRadius,
      Color color, IconData icon, String text, Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: screenSize(context).width * 0.45,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.horizontal(
            left: leftRadius,
            right: rightRadius,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.white,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
