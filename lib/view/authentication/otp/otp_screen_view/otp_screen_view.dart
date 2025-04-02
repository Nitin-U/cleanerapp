import 'package:cleanerapp/custom_widget/button.dart';
import 'package:cleanerapp/utils/appcolors.dart';
import 'package:cleanerapp/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class OtpScreenView extends StatelessWidget {
  const OtpScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final defaultpintheme = PinTheme(
        height: 50.r,
        width: MediaQuery.sizeOf(context).width,
        textStyle: dashboardlabelfontblack,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(color: CleanerAppcolors.primarygreycolor)));
    return Scaffold(
      backgroundColor: CleanerAppcolors.primarylightgreycolor,
      appBar: AppBar(
        backgroundColor: CleanerAppcolors.primarylightgreycolor,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'We have send',
              style: loginscreentitlefont,
            ),
            SizedBox(
              height: 5.r,
            ),
            Text(
              'OTP on your email',
              style: loginscreentitlefont,
            ),
            SizedBox(
              height: 15.r,
            ),
            Pinput(
              focusedPinTheme: defaultpintheme,
              defaultPinTheme: defaultpintheme,
              length: 5,
            ),
            SizedBox(
              height: 10.r,
            ),
            Row(
              spacing: 5.r,
              children: [
                Text(
                  "Didn't get otp?",
                  style: dashboardlablefontgrey,
                ),
                Text(
                  'Resend',
                  style: resendfont,
                )
              ],
            ),
            SizedBox(
              height: 15.r,
            ),
            CleanerButton.elevated(
              height: 55.r,
              width: MediaQuery.sizeOf(context).width,
              backgroundcolor: CleanerAppcolors.primarybrowncolor,
              label: 'Verify',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
