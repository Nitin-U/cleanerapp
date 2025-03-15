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
        height: 50.h,
        width: 50.w,
        textStyle: dashboardlabelfontblack,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.51.sp),
            border: Border.all(color: CleanerAppcolors.primarygreycolor)));
    return Scaffold(
      backgroundColor: CleanerAppcolors.primarylightgreycolor,
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 60.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'We have send',
              style: loginscreentitlefont,
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              'OTP on your email',
              style: loginscreentitlefont,
            ),
            SizedBox(
              height: 10.h,
            ),
            Pinput(
              focusedPinTheme: defaultpintheme,
              defaultPinTheme: defaultpintheme,
              length: 5,
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              spacing: 5.w,
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
              height: 25.h,
            ),
            CleanerButton.elevated(
              width: MediaQuery.sizeOf(context).width,
              backgroundcolor: CleanerAppcolors.primaryGreencolor,
              label: 'Verify',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
