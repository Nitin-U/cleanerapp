import 'package:cleanerapp/utils/appcolors.dart';
import 'package:cleanerapp/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CleanerTextfield extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
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
      this.onTap,
      this.onChanged,
      this.controller,
      this.prefix,
      this.validation,
      this.obstructtext});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      onTap: onTap,
      obscureText: obstructtext ?? false,
      validator: validation,
      controller: controller,
      style: dashboardlabelfontblack,
      decoration: InputDecoration(
          prefixIconConstraints: BoxConstraints(minWidth: 45.w),
          suffixIconConstraints: BoxConstraints(minWidth: 45.w),
          prefixIconColor: CleanerAppcolors.primarygreycolor,
          errorStyle: errorstyle,
          isDense: true,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: CleanerAppcolors.primarybrowncolor),
              borderRadius: BorderRadius.circular(20.r)),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 20.h),
          hintStyle: dashboardlablefontgrey,
          disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(20.r)),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(20.r)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(20.r)),
          prefixIcon: prefix,
          suffixIcon: suffix,
          hintText: hintlabel),
    );
  }
}
