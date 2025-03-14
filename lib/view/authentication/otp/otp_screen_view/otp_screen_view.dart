import 'package:cleanerapp/custom_widget/button.dart';
import 'package:cleanerapp/utils/appcolors.dart';
import 'package:cleanerapp/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OtpScreenView extends StatelessWidget {
  const OtpScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final defaultpintheme = PinTheme(
        height: 50,
        width: 50,
        textStyle: dashboardlabelfontblack,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.51),
            border: Border.all(color: CleanerAppcolors.primarygreycolor)));
    return Scaffold(
      backgroundColor: CleanerAppcolors.primarylightgreycolor,
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'We have send',
              style: loginscreentitlefont,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'OTP on your email',
              style: loginscreentitlefont,
            ),
            SizedBox(
              height: 10,
            ),
            Pinput(
              focusedPinTheme: defaultpintheme,
              defaultPinTheme: defaultpintheme,
              length: 5,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              spacing: 5,
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
              height: 25,
            ),
            CleanerButton.elevated(
              width: MediaQuery.sizeOf(context).width,
              backgroundcolor: CleanerAppcolors.primaryGreencolor,
              label: 'Verify',
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
