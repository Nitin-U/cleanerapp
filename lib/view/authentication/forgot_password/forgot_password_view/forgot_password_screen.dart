import 'package:cleanerapp/custom_widget/button.dart';
import 'package:cleanerapp/custom_widget/cleaner_textfield.dart';
import 'package:cleanerapp/utils/appcolors.dart';
import 'package:cleanerapp/utils/style.dart';
import 'package:cleanerapp/view/authentication/otp/otp_screen_view/otp_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CleanerAppcolors.primarylightgreycolor,
      appBar: AppBar(
        backgroundColor: CleanerAppcolors.primarylightgreycolor,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 50, horizontal: 24).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Confirm', style: loginscreentitlefont),
            SizedBox(
              height: 5.r,
            ),
            Text('Your Email', style: loginscreentitlefont),
            SizedBox(
              height: 10.r,
            ),
            Text(
              'Enter the email associated with your account and we’ll send an email with code to reset your password.',
              style: dashboardlablefontgrey,
            ),
            SizedBox(
              height: 5.r,
            ),
            Text('Email', style: dashboardlablefontgrey),
            SizedBox(
              height: 5.r,
            ),
            CleanerTextfield(
                autofills: [AutofillHints.email],
                prefix: Icon(Icons.email),
                hintlabel: 'Enter Your Email'),
            SizedBox(
              height: 25.r,
            ),
            CleanerButton.navigation(
              height: 55.r,
              width: MediaQuery.sizeOf(context).width,
              backgroundcolor: CleanerAppcolors.primarybrowncolor,
              label: 'Send code your email',
              destination: OtpScreenView(),
            )
          ],
        ),
      ),
    );
  }
}
