import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:xiomi_ode_to_code/utils/size.dart';
import 'package:xiomi_ode_to_code/utils/text_style.dart';

enum ToastLevel { error, success, warning, info, delete }

// flutter toast
void showToast(String msg) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.SNACKBAR,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.black,
    textColor: Colors.white,
    fontSize: 15.0,
  );
}

// bottom toast
void showFlagMsg(
    {required BuildContext context,
    required String msg,
    required Color textColor}) {
  final size = screenSize(context);
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return ListTile(
        dense: true,
        minLeadingWidth: 0,
        horizontalTitleGap: 0,
        leading: Icon(
          Icons.error,
          color: textColor,
          size: 18,
        ),
        title: Text(
          msg,
          textAlign: TextAlign.center,
          style: bodyStyle2(
              context: context, size: size.height * 0.02, color: textColor),
        ),
      );
    },
  );
}
