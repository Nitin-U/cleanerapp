import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  bool hidepassword = true;
  void toggleHidepassword() {
    hidepassword = !hidepassword;
    notifyListeners();
  }
}
