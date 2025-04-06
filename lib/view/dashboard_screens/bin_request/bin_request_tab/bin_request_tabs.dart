import 'package:cleanerapp/utils/appcolors.dart';
import 'package:cleanerapp/utils/style.dart';
import 'package:cleanerapp/view/dashboard_screens/bin_request/bin_request_provider/bin_request_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class BinRequestTabs extends StatelessWidget {
  const BinRequestTabs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<BinRequestProvider>(
      builder: (context, home, child) {
        return Row(
          spacing: 5.r,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  home.toggleTab(home.currenttab = 0);
                },
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        gradient: home.currenttab == 0
                            ? LinearGradient(colors: [
                                CleanerAppcolors.primarylightbrowncolor,
                                CleanerAppcolors.primarybrowncolor
                              ])
                            : LinearGradient(colors: [
                                CleanerAppcolors.primarylightgreycolor,
                                CleanerAppcolors.primarylightgreycolor
                              ]),
                        border: Border.all(
                            color: home.currenttab == 0
                                ? Colors.transparent
                                : CleanerAppcolors.primaryminidarkgreycolor),
                        borderRadius: BorderRadius.circular(20.r)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 13).r,
                      child: Center(
                        child: Text(
                          'On Site Delivery',
                          style: home.currenttab == 0
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
                  home.toggleTab(home.currenttab = 1);
                },
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        gradient: home.currenttab == 1
                            ? LinearGradient(colors: [
                                CleanerAppcolors.primarylightbrowncolor,
                                CleanerAppcolors.primarybrowncolor
                              ])
                            : LinearGradient(colors: [
                                CleanerAppcolors.primarylightgreycolor,
                                CleanerAppcolors.primarylightgreycolor
                              ]),
                        border: Border.all(
                            color: home.currenttab == 1
                                ? Colors.transparent
                                : CleanerAppcolors.primaryminidarkgreycolor),
                        borderRadius: BorderRadius.circular(20.r)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 13).r,
                      child: Center(
                        child: Text(
                          'Warehouse Delivery',
                          style: home.currenttab == 1
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
