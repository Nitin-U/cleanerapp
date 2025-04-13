
import 'package:binbookingapp/custom_widget/transaction_route.dart';
import 'package:binbookingapp/utils/style.dart';
import 'package:binbookingapp/view/authentication/login/model/user_model.dart';
import 'package:binbookingapp/view/authentication/login/service/login_api_service.dart';
import 'package:binbookingapp/view/dashboard/dashboard_view/dashboard_view.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  UserModel? _userModel;
  UserModel? get user => _userModel;

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
      _userModel = UserModel.fromJson(userMap);
      if (userMap['status'] == 'success') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
          userMap['message'],
          style: dashboardlablefontwhite,
        )));
        Navigator.pushAndRemoveUntil(
          context,
          CustomPageRoute(child: const DashboardView()),
          (route) => false,
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
          userMap['message'],
          style: dashboardlablefontwhite,
        )));
      }

      loadinglogin = false;
      notifyListeners();
    } catch (e) {
      loadinglogin = false;
      notifyListeners();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$e')));
      print('Error: $e'); // Log the error for debugging
      throw {"error": e};
    }
  }
}
