import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  String getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return "Good Morning !!!";
    } else if (hour < 18) {
      return "Good Afternoon !!!";
    } else {
      return "Good Evening !!!";
    }
  }
}
