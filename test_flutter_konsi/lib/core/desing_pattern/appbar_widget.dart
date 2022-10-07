// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_flutter_konsi/core/utils/colors.dart';

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  final String text;
  final Function()? getBack;
  final List<Widget>? actions;
  final Color textColor, backgroundColor;
  final bool enableBackButton;
  final Widget? leading;
  AppBarWidget({
    super.key,
    this.text = '',
    this.actions,
    this.getBack,
    this.leading,
    this.textColor = Colors.white,
    this.backgroundColor = myPrimaryColor,
    this.enableBackButton = true,
  }) : preferredSize = const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 50,
      centerTitle: true,
      title: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w700,
        ),
      ),
      leading: leading ??
          (enableBackButton
              ? Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: getBack ?? Get.back,
                    color: textColor,
                  ),
                )
              : Container()),
      leadingWidth: 60,
      actions: actions,
      backgroundColor: backgroundColor,
      elevation: 0,
    );
  }

  @override
  Size preferredSize;
}
