import 'package:flutter/material.dart';
import 'package:xiomi_ode_to_code/utils/color.dart';
import 'package:xiomi_ode_to_code/utils/text_style.dart';

class CustomDropDown extends StatefulWidget {
  final String? label;
  final TextStyle? labelStyle;
  final EdgeInsetsGeometry? labelPadding;
  final FocusNode? focus;
  final String? hint;
  final List<DropdownMenuItem<dynamic>> list;
  final Function(dynamic newSelection)? onChanged;
  final dynamic selectedValue;
  final bool mandatory;
  final InputBorder? border;
  final String? Function(dynamic val)? validatorFn;
  final Color? fillColor;
  final Widget? extended;
  const CustomDropDown(
      {Key? key,
      this.label,
      this.labelStyle,
      this.focus,
      this.labelPadding,
      this.hint,
      required this.list,
      this.onChanged,
      this.selectedValue,
      this.mandatory = false,
      this.border,
      this.validatorFn,
      this.fillColor,
      this.extended})
      : super(key: key);

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
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
                          context: context, size: 14, color: txtColor),
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
        DropdownButtonFormField<dynamic>(
          focusNode: widget.focus,
          decoration: InputDecoration(
              filled: true,
              fillColor: widget.fillColor ?? Colors.white,
              enabledBorder: widget.border,
              border: widget.border,
              focusedBorder: widget.border,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 17.0, horizontal: 10.0)),
          isExpanded: true,
          hint: Text(
            widget.hint!,
            style: bodyStyle1(context: context, size: 16, color: lightGrey),
          ),
          icon: const Icon(
            Icons.keyboard_arrow_down,
            color: Colors.grey,
            size: 25.0,
          ),
          style: const TextStyle(
              fontSize: 17.0, fontFamily: 'NunitoSans', color: Colors.black54),
          items: widget.list,
          validator: widget.validatorFn,
          onChanged: widget.onChanged,
          value: widget.selectedValue,
        ),
        if (widget.extended != null) widget.extended!
      ],
    );
  }
}
