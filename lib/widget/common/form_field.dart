import 'package:flutter/material.dart';
import 'package:xiomi_ode_to_code/utils/color.dart';
import 'package:xiomi_ode_to_code/utils/decoration.dart';
import 'package:xiomi_ode_to_code/utils/text_style.dart';

class CustomFormField extends StatefulWidget {
  final String? label;
  final TextStyle? labelStyle;
  final bool readOnly;
  final bool infinityLines;
  final EdgeInsetsGeometry? labelPadding;
  final bool obscure;
  final bool mandatory;
  final int? maxLine;
  final Color? fillColor;
  final Color? labelColor;
  final Color? titleColor;
  final Color? hintColor;
  final FocusNode? focus;
  final String? hint;
  final String? labelTxt;
  final String? initValue;
  final Widget? prefix;
  final Widget? suffix;
  final Widget? counter;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final TextInputType? inputType;
  final String? Function(String?)? validatorFn;
  final Function(String)? onChanged;
  final Function()? onTap;
  final Function(String)? onFiledSubmitted;
  final InputBorder? border;

  const CustomFormField(
      {Key? key,
      this.label,
      this.labelStyle,
      this.readOnly = false,
      this.infinityLines = false,
      this.labelPadding,
      this.obscure = false,
      this.mandatory = false,
      this.maxLine,
      this.fillColor,
      this.labelColor,
      this.titleColor,
      this.hintColor,
      this.focus,
      this.hint,
      this.labelTxt,
      this.initValue,
      this.prefix,
      this.suffix,
      this.counter,
      this.textInputAction,
      this.controller,
      this.inputType,
      this.validatorFn,
      this.onChanged,
      this.onTap,
      this.onFiledSubmitted,
      this.border})
      : super(key: key);

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          Padding(
            padding: widget.labelPadding ??
                const EdgeInsets.only(left: 0, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '${widget.label}',
                  style: widget.labelStyle ??
                      headingStyle1(
                          context: context,
                          size: 14,
                          color: widget.labelColor ?? txtColor),
                ),
                if (widget.mandatory)
                  Text(
                    '*',
                    style:
                        headingStyle1(context: context, size: 17, color: red),
                  ),
              ],
            ),
          ),
        TextFormField(
          maxLines: widget.infinityLines ? null : widget.maxLine ?? 1,
          readOnly: widget.readOnly,
          autofocus: false,
          focusNode: widget.focus,
          controller: widget.controller,
          initialValue: widget.initValue,
          obscureText: widget.obscure,
          keyboardAppearance: Brightness.dark,
          textInputAction: widget.textInputAction ?? TextInputAction.next,
          style: bodyStyle1(
              context: context,
              size: 18,
              color: widget.titleColor ?? Colors.black54),
          keyboardType: widget.inputType,
          decoration: InputDecoration(
              filled: true,
              fillColor: widget.fillColor ?? Colors.white,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
              border: widget.border ?? border1,
              enabledBorder: widget.border ?? border1,
              disabledBorder: widget.border ?? border1,
              errorBorder: widget.border ?? border1,
              focusedBorder: widget.border ?? border1,
              focusedErrorBorder: widget.border ?? border1,
              suffixIcon: widget.suffix,
              prefixIcon: widget.prefix,
              counter: widget.counter,
              hintText: widget.hint,
              isDense: true,
              errorStyle: bodyStyle1(context: context, size: 12, color: red),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              labelText: widget.labelTxt,
              labelStyle: bodyStyle1(
                  context: context,
                  size: 16,
                  color: widget.titleColor ?? txtColor),
              hintStyle: bodyStyle1(
                  context: context,
                  size: 16,
                  color: widget.hintColor ?? lightGrey)),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: widget.validatorFn,
          onChanged: widget.onChanged ?? (String value) {},
          onTap: widget.onTap ?? () {},
          onFieldSubmitted: widget.onFiledSubmitted ?? (String value) {},
        ),
      ],
    );
  }
}
