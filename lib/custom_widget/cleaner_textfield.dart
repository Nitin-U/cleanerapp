import 'package:cleanerapp/utils/style.dart';
import 'package:flutter/material.dart';

class CleanerTextfield extends StatelessWidget {
  final String hintlabel;
  final Widget? suffix;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validation;
  final Widget? prefix;
  const CleanerTextfield(
      {super.key,
      required this.hintlabel,
      this.suffix,
      this.controller,
      this.prefix,
      this.validation});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validation,
      controller: controller,
      style: dashboardlabelfontblack,
      decoration: InputDecoration(
          constraints: BoxConstraints(maxHeight: 30),
          errorStyle: errorstyle,
          isDense: true,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green),
              borderRadius: BorderRadius.circular(10)),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
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
