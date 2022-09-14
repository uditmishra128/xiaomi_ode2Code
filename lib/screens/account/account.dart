import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:xiomi_ode_to_code/utils/color.dart';
import 'package:xiomi_ode_to_code/utils/decoration.dart';
import 'package:xiomi_ode_to_code/utils/img_const.dart';
import 'package:xiomi_ode_to_code/utils/text_style.dart';

class AccountScreen extends StatefulWidget {
  final bool isStudent;
  const AccountScreen({Key? key, this.isStudent = false}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey1,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              decoration: oneSideCurve(primary, false, curve: 30),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 60, bottom: 50),
                    decoration: oneSideCurve(Colors.white, false, curve: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          backgroundImage: AssetImage(dummyProfile),
                          radius: 35,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Mi POS",
                              style: headingStyle1(context: context, size: 18)
                                  .copyWith(fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "mi@gmail.com",
                              style: bodyStyle2(
                                  context: context,
                                  size: 16,
                                  color: Colors.black),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  _customListTile(
                      'Edit Profile', FontAwesomeIcons.userLarge, () {}),
                  const Divider(
                    color: Colors.white,
                    thickness: 1,
                    height: 1,
                  ),
                  _customListTile(
                      'Anuual sell', FontAwesomeIcons.wallet, () {}),
                  const Divider(
                    color: Colors.white,
                    thickness: 1,
                    height: 1,
                  ),
                  _customListTile(
                      'Change Pass word', FontAwesomeIcons.lock, () {}),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              color: Colors.white,
              child: ListTile(
                onTap: () async {},
                leading: FaIcon(
                  FontAwesomeIcons.rightFromBracket,
                  color: red,
                  size: 20,
                ),
                title: Text(
                  'Log Out',
                  style: bodyStyle2(context: context, color: red, size: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _customListTile(String title, IconData icon, Function()? onTap,
      {Color? color}) {
    return ListTile(
      onTap: onTap,
      leading: FaIcon(
        icon,
        color: color ?? Colors.white,
        size: 20,
      ),
      title: Text(
        title,
        style: bodyStyle2(
            context: context, color: color ?? Colors.white, size: 16),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        color: color ?? Colors.white,
        size: 20,
      ),
    );
  }
}
