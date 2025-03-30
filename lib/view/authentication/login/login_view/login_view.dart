import 'package:cleanerapp/custom_widget/button.dart';
import 'package:cleanerapp/custom_widget/cleaner_textfield.dart';
import 'package:cleanerapp/custom_widget/transaction_route.dart';
import 'package:cleanerapp/utils/appcolors.dart';
import 'package:cleanerapp/utils/form_validation.dart';
import 'package:cleanerapp/utils/style.dart';
import 'package:cleanerapp/view/authentication/forgot_password/forgot_password_view/forgot_password_screen.dart';
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
        final loginkey = GlobalKey<FormState>();

        return Scaffold(
          backgroundColor: CleanerAppcolors.primarylightgreycolor,
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 25.w,
            ),
            child: SingleChildScrollView(
              child: Form(
                key: loginkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 180.h,
                    ),
                    Text('Hello!', style: loginscreentitlefont),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text('Welcome Back', style: loginscreentitlefont),
                    SizedBox(
                      height: 40.h,
                    ),
                    Text(
                      'Email',
                      style: dashboardlablefontgrey,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    CleanerTextfield(
                      validation: validateEmail,
                      controller: login.emailcontroller,
                      prefix: Icon(
                        Icons.email,
                        size: 16.h,
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
                        validation: validatePassword,
                        controller: login.passwordcontroller,
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
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context,
                                CustomPageRoute(child: ForgotPasswordScreen()));
                          },
                          child: Text(
                            'Forgot Password',
                            style: forgotpasswordfont,
                          ),
                        )),
                    SizedBox(
                      height: 10.h,
                    ),
                    CleanerButton.elevated(
                      height: 55.h,
                      width: MediaQuery.sizeOf(context).width,
                      backgroundcolor: CleanerAppcolors.primarybrowncolor,
                      label: 'Login',
                      onPressed: () {
                        if (loginkey.currentState!.validate()) {
                          login.getLogin(context);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
