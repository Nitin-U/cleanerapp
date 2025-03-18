import 'package:cleanerapp/utils/style.dart';
import 'package:cleanerapp/view/dashboard_screens/home/home_provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../utils/appcolors.dart';

class OrdersTabs extends StatelessWidget {
  const OrdersTabs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, home, child) {
        return Row(
          spacing: 5.w,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  home.getTab(home.tabs = 0);
                },
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        gradient: home.tabs == 0
                            ? LinearGradient(colors: [
                                CleanerAppcolors.primarylightbrowncolor,
                                CleanerAppcolors.primarybrowncolor
                              ])
                            : LinearGradient(colors: [
                                CleanerAppcolors.primarylightgreycolor,
                                CleanerAppcolors.primarylightgreycolor
                              ]),
                        border: Border.all(
                            color: home.tabs == 0
                                ? Colors.transparent
                                : CleanerAppcolors.primarygreycolor),
                        borderRadius: BorderRadius.circular(20.r)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 13.h),
                      child: Center(
                        child: Text(
                          'My Orders',
                          style: home.tabs == 0
                              ? resendwhitefont
                              : resendfontminigrey,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  home.getTab(home.tabs = 1);
                },
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        gradient: home.tabs == 1
                            ? LinearGradient(colors: [
                                CleanerAppcolors.primarylightbrowncolor,
                                CleanerAppcolors.primarybrowncolor
                              ])
                            : LinearGradient(colors: [
                                CleanerAppcolors.primarylightgreycolor,
                                CleanerAppcolors.primarylightgreycolor
                              ]),
                        border: Border.all(
                            color: home.tabs == 1
                                ? Colors.transparent
                                : CleanerAppcolors.primarygreycolor),
                        borderRadius: BorderRadius.circular(20.r)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 13.sp),
                      child: Center(
                        child: Text(
                          'Bin Requests',
                          style: home.tabs == 1
                              ? resendwhitefont
                              : resendfontminigrey,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
