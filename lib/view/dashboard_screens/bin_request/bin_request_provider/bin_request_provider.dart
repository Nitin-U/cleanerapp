import 'package:flutter/material.dart';

class BinRequestProvider extends ChangeNotifier {
  int currenttab = 0;
  void toggleTab(int index) {
    currenttab = index;
    notifyListeners();
  }

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
}
