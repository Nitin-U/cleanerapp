import 'package:cleanerapp/providers/cleaner_app_provider.dart';
import 'package:cleanerapp/view/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: getProviders(), child: ScreenUtilInit(
    designSize: Size(430, 923),
    child: const MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        home: SplashScreen());
  }
}
