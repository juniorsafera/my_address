import 'package:flutter/material.dart';
import 'package:test_flutter_konsi/core/utils/colors.dart';

class SearchTextFormFieldWidget extends StatelessWidget {
  final String? hintText;
  final TextEditingController? textController;
  final Function(String? value)? onChange;
  const SearchTextFormFieldWidget({
    super.key,
    this.hintText,
    this.textController,
    this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        controller: textController,
        onChanged: onChange,
        decoration: InputDecoration(
          suffixIcon: const Icon(
            Icons.search,
            color: Colors.black45,
          ),
          contentPadding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.black38,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: const BorderSide(color: myPrimaryColor, width: 1.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: const BorderSide(color: Colors.black38, width: 1.0),
          ),
        ),
      ),
    );
  }
}
