import 'dart:async';

import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void nextPage() {
    Timer(const Duration(seconds: 3), () {
     
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold();
  }
}
