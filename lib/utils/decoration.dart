import 'package:flutter/material.dart';
import 'package:xiomi_ode_to_code/utils/color.dart';

InputBorder get border1 => OutlineInputBorder(
    borderRadius: BorderRadius.circular(30.0),
    borderSide: const BorderSide(color: Colors.white));

InputBorder get border2 => OutlineInputBorder(
    borderRadius: BorderRadius.circular(4.0),
    borderSide: const BorderSide(color: Colors.white));

InputBorder? get border3 =>
    UnderlineInputBorder(borderSide: BorderSide(color: blue1));

InputBorder? border4(Color? color, double? curve) {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(curve ?? 4.0),
      borderSide: BorderSide(color: color ?? blue1));
}

InputBorder? border5(Color? color, bool top) {
  return OutlineInputBorder(
      borderRadius: top
          ? const BorderRadius.only(
              topLeft: Radius.circular(8), topRight: Radius.circular(8))
          : const BorderRadius.only(
              bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
      borderSide: BorderSide(color: color ?? blue1));
}

BoxDecoration? oneSideCurve(Color? color, bool top, {double? curve}) {
  return BoxDecoration(
    color: color,
    borderRadius: top
        ? BorderRadius.only(
            topLeft: Radius.circular(curve ?? 8),
            topRight: Radius.circular(curve ?? 8))
        : BorderRadius.only(
            bottomLeft: Radius.circular(curve ?? 8),
            bottomRight: Radius.circular(curve ?? 8)),
  );
}

BoxDecoration outlineDecoration({Color? color, double? curve, double? width}) {
  return BoxDecoration(
    border: Border.all(color: color ?? primary, width: width ?? 2),
    borderRadius: BorderRadius.circular(curve ?? 30),
  );
}

BoxDecoration filledDecoration({double? curve, Color? color}) {
  return BoxDecoration(
    color: color ?? secondary,
    borderRadius: BorderRadius.circular(curve ?? 30),
  );
}
