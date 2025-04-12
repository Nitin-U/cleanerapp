import 'dart:async';

import 'package:binbookingapp/custom_widget/transaction_route.dart';
import 'package:binbookingapp/utils/appcolors.dart';
import 'package:binbookingapp/utils/cleanericonspng.dart';
import 'package:binbookingapp/view/authentication/login/login_view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    nextPage();
  }

  void nextPage() {
    Timer(const Duration(seconds: 3), () {
      Navigator.push(context, CustomPageRoute(child: LoginView()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CleanerAppcolors.primarylightgreycolor,
      body: Center(
        child: Column(
          spacing: 5.r,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppIcons.cleanerbinlogo),
            LoadingAnimationWidget.dotsTriangle(
                color: CleanerAppcolors.primarybrowncolor, size: 25.r)
          ],
        ),
      ),
    );
  }
}
