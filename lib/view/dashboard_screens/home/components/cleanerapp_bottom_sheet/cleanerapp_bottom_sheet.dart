import 'package:cleanerapp/custom_widget/button.dart';
import 'package:cleanerapp/custom_widget/cleaner_textfield.dart';
import 'package:cleanerapp/utils/appcolors.dart';
import 'package:cleanerapp/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CleanerAppBottomSheet extends StatelessWidget {
  const CleanerAppBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: DecoratedBox(
        decoration:
            BoxDecoration(color: CleanerAppcolors.primarylightgreycolor),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: Column(
            spacing: 5.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                child: Column(
                  spacing: 5.h,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Order No:',
                      style: listiletitlefont,
                    ),
                    CleanerTextfield(
                      prefix: Icon(Icons.format_list_numbered),
                      hintlabel: 'Enter order no',
                    ),
                    Text(
                      'Location',
                      style: listiletitlefont,
                    ),
                    CleanerTextfield(
                        prefix: Icon(Icons.pin_drop),
                        hintlabel: 'Enter your location'),
                    Text(
                      'Duration',
                      style: listiletitlefont,
                    ),
                    CleanerTextfield(
                        prefix: Icon(Icons.timer), hintlabel: 'Enter duration'),
                    Text(
                      'Estimated place',
                      style: listiletitlefont,
                    ),
                    CleanerTextfield(
                        prefix: Icon(Icons.location_city),
                        hintlabel: 'Enter place'),
                    SizedBox(
                      height: 8.h,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: CleanerButton.elevated(
                    backgroundcolor: CleanerAppcolors.primarybrowncolor,
                    width: MediaQuery.sizeOf(context).width,
                    label: 'Confirm Order',
                    onPressed: () {}),
              )
            ],
          ),
        ),
      ),
    );
  }
}
