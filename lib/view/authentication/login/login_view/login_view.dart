import 'package:cleanerapp/custom_widget/button.dart';
import 'package:cleanerapp/custom_widget/cleaner_textfield.dart';
import 'package:cleanerapp/utils/style.dart';
import 'package:cleanerapp/view/dashboard/dashboard_view/dashboard_view.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 90),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hello!', style: loginscreentitlefont),
            SizedBox(
              height: 5,
            ),
            Text('Welcome Back', style: loginscreentitlefont),
            SizedBox(
              height: 30,
            ),
            Text(
              'Email',
              style: dashboardlablefontgrey,
            ),
            SizedBox(
              height: 5,
            ),
            CleanerTextfield(
              prefix: Icon(
                Icons.email,
                size: 13,
              ),
              hintlabel: 'Enter your email',
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Password',
              style: dashboardlablefontgrey,
            ),
            SizedBox(
              height: 5,
            ),
            CleanerTextfield(
                prefix: Icon(
                  Icons.lock,
                  size: 13,
                ),
                hintlabel: 'Enter your password'),
            Align(
                alignment: Alignment.bottomRight,
                child: CleanerButton.text(
                    label: 'Forgot Password', onPressed: () {})),
            SizedBox(
              height: 0,
            ),
            CleanerButton.navigation(
              width: MediaQuery.sizeOf(context).width,
              backgroundcolor: Colors.green,
              label: 'Login',
              destination: DashboardView(),
            )
          ],
        ),
      ),
    );
  }
}
