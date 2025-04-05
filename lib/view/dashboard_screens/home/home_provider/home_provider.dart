import 'package:cleanerapp/view/authentication/login/model/user_model.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  UserModel? _userModel;
  UserModel? get user => _userModel;
  int tabs = 0;
  List<String> ordersData = [
    'Summers',
    'Summers',
    'Summers',
    'Summers',
    'Summers',
    'Summers',
    'Summers',
    'Summers',
    'Summers',
    'Summers',
    'Summers',
    'Summers',
    'Summers',
    'Summers',
  ];

  List<String> binRequestData = [
    'Summers',
    'Summers',
    'Summers',
    'Summers',
    'Summers',
    'Summers',
    'Summers',
    'Summers',
    'Summers',
    'Summers',
    'Summers',
    'Summers',
    'Summers',
    'Summers',
  ];
  void toggleTab(int index) {
    tabs = index;
    notifyListeners();
  }

  String getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return "Good Morning !";
    } else if (hour < 18) {
      return "Good Afternoon !";
    } else {
      return "Good Evening !";
    }
  }
}
