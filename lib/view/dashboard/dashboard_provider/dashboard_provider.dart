import 'package:cleanerapp/view/dashboard_screens/active_orders/active_orders_view/active_order_screen.dart';
import 'package:cleanerapp/view/dashboard_screens/home/home_view/home_screen.dart';
import 'package:cleanerapp/view/dashboard_screens/my_orders/my_orders_view/my_orders_screen.dart';
import 'package:cleanerapp/view/dashboard_screens/profile/profile_view/profile_screen.dart';
import 'package:flutter/material.dart';

class DashboardProvider extends ChangeNotifier {
  int currenttab = 0;
  List<Widget> screens = [
    HomeScreen(),
    ActiveOrderScreen(),
    MyOrdersScreen(),
    ProfileScreen()
  ];
  void screenTabs(int index) {
    currenttab = index;
    notifyListeners();
  }
}
