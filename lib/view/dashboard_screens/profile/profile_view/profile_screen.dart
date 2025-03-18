import 'package:cleanerapp/utils/appcolors.dart';
import 'package:cleanerapp/utils/style.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CleanerAppcolors.primarylightgreycolor,
        title: Text(
          'Profile',
          style: appbartitlefont,
        ),
      ),
      backgroundColor: CleanerAppcolors.primarylightgreycolor,
    );
  }
}
