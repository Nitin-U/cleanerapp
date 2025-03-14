import 'dart:async';

import 'package:cleanerapp/custom_widget/transaction_route.dart';
import 'package:cleanerapp/utils/appcolors.dart';
import 'package:cleanerapp/utils/cleanericonspng.dart';
import 'package:cleanerapp/utils/style.dart';
import 'package:cleanerapp/view/authentication/login/login_view/login_view.dart';
import 'package:flutter/material.dart';

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
          spacing: 5,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppIcons.cleanerbinlogo),
            Text(
              textAlign: TextAlign.center,
              'Loading...',
              style: splashloadingfond,
            ),
            SizedBox(
              width: 100,
              child: LinearProgressIndicator(
                color: Colors.green,
              ),
            )
          ],
        ),
      ),
    );
  }
}
