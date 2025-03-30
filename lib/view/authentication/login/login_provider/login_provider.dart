import 'package:cleanerapp/view/authentication/login/service/login_api_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginProvider extends ChangeNotifier {
  bool loadinglogin = false;
  bool hidepassword = true;

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  void toggleHidepassword() {
    hidepassword = !hidepassword;
    notifyListeners();
  }

  Future<void> getLogin(context) async {
    try {
      loadinglogin = true;
      notifyListeners();

      final userMap = await fetchLogindata(
        emailcontroller.text,
        passwordcontroller.text,
      );

      if (userMap['statusCode'] == 200) {
        Fluttertoast.showToast(msg: userMap['message']);
        // Navigator.pushAndRemoveUntil(
        //   context,
        //   CustomPageRoute(child: const DashboardView()),
        //   (route) => false,
        // );
      } else {
        print('Login failed: ${userMap['message']}');
        Fluttertoast.showToast(msg: userMap['message']);
      }

      loadinglogin = false;
      notifyListeners();
    } catch (e) {
      loadinglogin = false;
      notifyListeners();
      print('Error: $e'); // Log the error for debugging
      throw {"error": e};
    }
  }
}
