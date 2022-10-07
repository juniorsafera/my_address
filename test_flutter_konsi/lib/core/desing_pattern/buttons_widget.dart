import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_flutter_konsi/core/utils/colors.dart';

class MyButtons {
  MyButtons(
      {this.onPressed,
      this.text = '',
      this.color,
      this.icon,
      this.iconWidget,
      this.textColor,
      this.width,
      this.height});

  final Function()? onPressed;
  final String? text;
  final Color? color;
  final IconData? icon;
  final Widget? iconWidget;
  final Color? textColor;
  final double? width;
  final double? height;

  Widget roundedElevatedButton() {
    return SizedBox(
      width: Get.width,
      height: 55,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          backgroundColor: color ?? myPrimaryColor,
          textStyle: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 15),
        ),
        onPressed: onPressed,
        child: Text(
          text!,
          style: TextStyle(color: textColor ?? Colors.white, fontSize: 16),
        ),
      ),
    );
  }

  Widget basicTextButton() {
    return TextButton(
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          text!,
          style: TextStyle(color: color),
        ),
      ),
    );
  }
}
