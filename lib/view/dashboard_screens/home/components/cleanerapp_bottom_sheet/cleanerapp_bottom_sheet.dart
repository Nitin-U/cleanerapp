
import 'package:binbookingapp/custom_widget/button.dart';
import 'package:binbookingapp/custom_widget/cleaner_textfield.dart';
import 'package:binbookingapp/utils/appcolors.dart';
import 'package:binbookingapp/utils/style.dart';
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
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10).r,
          child: Column(
            spacing: 5.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    spacing: 5.r,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Order No:',
                        style: listiletitlefont,
                      ),
                      CleanerTextfield(
                        prefix: Icon(
                          Icons.format_list_numbered,
                          size: 18.r,
                        ),
                        hintlabel: 'Enter order no',
                      ),
                      Text(
                        'Location',
                        style: listiletitlefont,
                      ),
                      CleanerTextfield(
                          prefix: Icon(
                            Icons.pin_drop,
                            size: 18.r,
                          ),
                          hintlabel: 'Enter your location'),
                      Text(
                        'Duration',
                        style: listiletitlefont,
                      ),
                      CleanerTextfield(
                          prefix: Icon(
                            Icons.timer,
                            size: 18.r,
                          ),
                          hintlabel: 'Enter duration'),
                      Text(
                        'Estimated place',
                        style: listiletitlefont,
                      ),
                      CleanerTextfield(
                          prefix: Icon(
                            Icons.location_city,
                            size: 18.r,
                          ),
                          hintlabel: 'Enter place'),
                      SizedBox(
                        height: 8.r,
                      ),
                    ],
                  ),
                ),
              ),
              CleanerButton.elevated(
                  height: 55.r,
                  backgroundcolor: CleanerAppcolors.primarybrowncolor,
                  width: MediaQuery.sizeOf(context).width,
                  label: 'Confirm Order',
                  onPressed: () {})
            ],
          ),
        ),
      ),
    );
  }
}
