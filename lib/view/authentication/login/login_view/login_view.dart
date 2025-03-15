import 'package:cleanerapp/custom_widget/button.dart';
import 'package:cleanerapp/custom_widget/cleaner_textfield.dart';
import 'package:cleanerapp/utils/appcolors.dart';
import 'package:cleanerapp/utils/style.dart';
import 'package:cleanerapp/view/authentication/login/login_provider/login_provider.dart';
import 'package:cleanerapp/view/dashboard/dashboard_view/dashboard_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(
      builder: (context, login, child) {
        return Scaffold(
          backgroundColor: CleanerAppcolors.primarylightgreycolor,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 110.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Hello!', style: loginscreentitlefont),
                SizedBox(
                  height: 5.h,
                ),
                Text('Welcome Back', style: loginscreentitlefont),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  'Email',
                  style: dashboardlablefontgrey,
                ),
                SizedBox(
                  height: 5.h,
                ),
                CleanerTextfield(
                  prefix: Icon(
                    Icons.email,
                    size: 13.h,
                  ),
                  hintlabel: 'Enter your email',
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  'Password',
                  style: dashboardlablefontgrey,
                ),
                SizedBox(
                  height: 5.h,
                ),
                CleanerTextfield(
                    obstructtext: login.hidepassword,
                    suffix: InkWell(
                      onTap: () {
                        login.toggleHidepassword();
                      },
                      child: Icon(
                        login.hidepassword == true
                            ? Icons.visibility_off
                            : Icons.visibility,
                        size: 13,
                        color: login.hidepassword == true
                            ? CleanerAppcolors.primarygreycolor
                            : CleanerAppcolors.primarybrowncolor,
                      ),
                    ),
                    prefix: Icon(
                      Icons.lock,
                      size: 13.h,
                    ),
                    hintlabel: 'Enter your password'),
                SizedBox(
                  height: 10.h,
                ),
                Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      'Forgot Password',
                      style: forgotpasswordfont,
                    )),
                SizedBox(
                  height: 10.h,
                ),
                CleanerButton.navigation(
                  width: MediaQuery.sizeOf(context).width,
                  backgroundcolor: CleanerAppcolors.primarybrowncolor,
                  label: 'Login',
                  destination: DashboardView(),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
