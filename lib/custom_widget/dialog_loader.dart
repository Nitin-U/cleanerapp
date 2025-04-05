import 'package:cleanerapp/utils/appcolors.dart';
import 'package:cleanerapp/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Dialogloader extends StatelessWidget {
  const Dialogloader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        spacing: 5.r,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LoadingAnimationWidget.flickr(
              leftDotColor: CleanerAppcolors.primarybrowncolor,
              rightDotColor: CleanerAppcolors.primarylightbrowncolor,
              size: 20.r),
          Text(
            'Loading....',
            style: appbartitlefont,
          )
        ],
      ),
    );
  }
}
