// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/colors.dart';

class TextFieldWidget extends StatelessWidget {
  final String? hintText;
  final TextEditingController? textController;
  final Function(String? value)? onChange;
  String? Function(String?)? validator;
  List<TextInputFormatter>? inputFormatters;
  TextInputType? keyboardType;
  TextFieldWidget({
    super.key,
    this.hintText,
    this.textController,
    this.onChange,
    this.inputFormatters,
    this.validator,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        controller: textController,
        onChanged: onChange,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.black38,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.red, width: 1.0),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.red, width: 1.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: myPrimaryColor, width: 1.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.black38, width: 1.0),
          ),
        ),
        inputFormatters: inputFormatters,
        validator: validator,
        keyboardType: keyboardType,
      ),
    );
  }
}
