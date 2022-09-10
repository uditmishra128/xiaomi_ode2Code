import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xiomi_ode_to_code/utils/color.dart';
import 'package:xiomi_ode_to_code/utils/decoration.dart';
import 'package:xiomi_ode_to_code/utils/text_style.dart';
import 'package:xiomi_ode_to_code/widget/common/form_field.dart';

class CustomAppBar extends StatefulWidget with PreferredSizeWidget {
  final String? title;
  final Widget? searchIcon;
  final TextEditingController? searchController;
  final double? height;
  CustomAppBar({
    Key? key,
    this.title,
    this.searchIcon,
    this.searchController,
    this.height,
  }) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(height ?? kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Container(
        color: primary,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Stack(
          children: [
            if (widget.title != null)
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Text("${widget.title}",
                      textAlign: TextAlign.center,
                      style: headingStyle1(
                          context: context, size: 19, color: Colors.black)),
                ),
              ),
            if (widget.searchController != null)
              Container(
                padding: const EdgeInsets.only(top: 25, left: 10, right: 10),
                child: CustomFormField(
                  hint: 'Search',
                  contentPadding: EdgeInsets.zero,
                  border: border4(Colors.black54, 8),
                  controller: widget.searchController,
                  onChanged: (String val) {
                    setState(() {});
                  },
                  textInputAction: TextInputAction.next,
                  inputType: TextInputType.emailAddress,
                  prefix: const Icon(Icons.search),
                  onFiledSubmitted: (String val) {},
                ),
              ),
            if (widget.searchIcon != null)
              Align(
                alignment: Alignment.topRight,
                child: widget.searchIcon,
              )
          ],
        ),
      ),
    );
  }
}
