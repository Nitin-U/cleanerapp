

import 'package:flutter/material.dart';

class MyOrderProvider extends ChangeNotifier{
    int tabs = 0;
void toggleTab(int index) {
    tabs = index;
    notifyListeners();
  }
}