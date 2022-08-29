import 'package:flutter/material.dart';
import 'package:xiomi_ode_to_code/utils/color.dart';
import 'package:xiomi_ode_to_code/utils/decoration.dart';
import 'package:xiomi_ode_to_code/utils/loader.dart';
import 'package:xiomi_ode_to_code/utils/size.dart';
import 'package:xiomi_ode_to_code/utils/text_style.dart';

class CustomButton extends StatefulWidget {
  final Function()? onTap;
  final String title;
  final Decoration? decoration;
  final double? height;
  final double? length;
  final TextStyle? titleStyle;
  final bool loading;
  final bool icon;
  final String? logo;
  final double? curve;
  final Color? color;
  final Color? loaderColor;
  final Color? iconColor;
  final IconData? iconData;
  final FocusNode? focus;

  const CustomButton(
      {this.logo,
      this.onTap,
      required this.title,
      this.decoration,
      this.height,
      this.length,
      this.titleStyle,
      this.loading = false,
      this.color,
      this.loaderColor,
      this.curve,
      this.focus,
      this.iconData,
      this.icon = false,
      this.iconColor,
      Key? key})
      : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusNode: widget.focus,
      onTap: widget.loading ? null : widget.onTap,
      child: Container(
          height: widget.height ?? 50,
          width: widget.length ?? screenSize(context).width,
          decoration: widget.decoration ?? boxDecoration(),
          child: widget.loading
              ? spinKit(color: widget.loaderColor ?? Colors.white)
              : widget.logo == null && widget.icon == false
                  ? Center(
                      child: Text(
                        widget.title,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: widget.titleStyle ??
                            bodyStyle1(
                                context: context,
                                size: 18,
                                color: Colors.white),
                      ),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (widget.logo != null)
                          Padding(
                            padding: const EdgeInsets.only(right: 12.0),
                            child: Image(
                              image: AssetImage(widget.logo!),
                              width: 30,
                              height: 30,
                            ),
                          ),
                        if (widget.icon == true)
                          Padding(
                            padding: const EdgeInsets.only(right: 12.0),
                            child: Icon(
                              widget.iconData,
                              size: 20,
                              color: widget.iconColor,
                            ),
                          ),
                        Text(
                          widget.title,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: widget.titleStyle ??
                              bodyStyle1(
                                  context: context,
                                  size: 18,
                                  color: Colors.white),
                        ),
                      ],
                    )),
    );
  }

  BoxDecoration boxDecoration() {
    if (widget.onTap == null || widget.loading) {
      return filledDecoration(color: grey, curve: widget.curve);
    } else {
      return filledDecoration(curve: widget.curve, color: widget.color);
    }
  }
}
