import 'package:cleanerapp/utils/appcolors.dart';
import 'package:cleanerapp/utils/style.dart';
import 'package:flutter/material.dart';

class CleanerTextfield extends StatelessWidget {
  final String hintlabel;
  final Widget? suffix;
  final bool? obstructtext;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validation;
  final Widget? prefix;
  const CleanerTextfield(
      {super.key,
      required this.hintlabel,
      this.suffix,
      this.controller,
      this.prefix,
      this.validation,
      this.obstructtext});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obstructtext ?? false,
      validator: validation,
      controller: controller,
      style: dashboardlablefontgrey,
      decoration: InputDecoration(
          prefixIconColor: CleanerAppcolors.primarygreycolor,
          prefixIconConstraints: BoxConstraints.tight(Size(35, 35)),
          suffixIconConstraints: BoxConstraints.tight(Size(35, 35)),
          constraints: BoxConstraints(maxHeight: 40),
          errorStyle: errorstyle,
          isDense: true,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: CleanerAppcolors.primarybrowncolor),
              borderRadius: BorderRadius.circular(10)),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
          hintStyle: dashboardlablefontgrey,
          disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(10)),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(10)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(10)),
          prefixIcon: prefix,
          suffixIcon: suffix,
          hintText: hintlabel),
    );
  }
}
