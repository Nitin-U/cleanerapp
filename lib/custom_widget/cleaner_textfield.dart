import 'package:flutter/material.dart';

class CleanerTextfield extends StatelessWidget {
  final String hintlabel;
  final Widget? suffix;
  final Widget? prefix;
  const CleanerTextfield(
      {super.key, required this.hintlabel, this.suffix, this.prefix});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          hintStyle: TextStyle(fontSize: 12),
          disabledBorder: OutlineInputBorder(),
          errorBorder: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(),
          prefixIcon: prefix,
          suffixIcon: suffix,
          hintText: hintlabel),
    );
  }
}
