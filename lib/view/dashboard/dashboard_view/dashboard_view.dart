import 'package:cleanerapp/utils/appcolors.dart';
import 'package:cleanerapp/utils/cleanericonspng.dart';
import 'package:cleanerapp/utils/style.dart';
import 'package:cleanerapp/view/dashboard/dashboard_provider/dashboard_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(
      builder: (context, dash, child) {
        return Scaffold(
          backgroundColor: CleanerAppcolors.primarylightgreycolor,
          bottomNavigationBar: DecoratedBox(
            decoration: BoxDecoration(),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    dash.screenTabs(dash.currenttab = 0);
                  },
                  child: Column(
                    spacing: 5,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 2,
                        width: 50,
                        child: DecoratedBox(
                            decoration: BoxDecoration(
                                color: dash.currenttab == 0
                                    ? CleanerAppcolors.primarybrowncolor
                                    : null)),
                      ),
                      Image.asset(
                        AppIcons.homeicon,
                        height: 20.h,
                        color: dash.currenttab == 0
                            ? CleanerAppcolors.primarybrowncolor
                            : null,
                      ),
                      Text(
                        'Home',
                        style: dash.currenttab == 0
                            ? dashboardlablefontbrown
                            : dashboardlabelfontblack,
                      ),
                      SizedBox(
                        height: 5.h,
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    dash.screenTabs(dash.currenttab = 1);
                  },
                  child: Column(
                    spacing: 5,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 2.h,
                        width: 50.w,
                        child: DecoratedBox(
                            decoration: BoxDecoration(
                                color: dash.currenttab == 1
                                    ? CleanerAppcolors.primarybrowncolor
                                    : null)),
                      ),
                      Image.asset(
                        AppIcons.requesticon,
                        height: 20.h,
                        color: dash.currenttab == 1
                            ? CleanerAppcolors.primarybrowncolor
                            : null,
                      ),
                      Text(
                        'Bin Request',
                        style: dash.currenttab == 1
                            ? dashboardlablefontbrown
                            : dashboardlabelfontblack,
                      ),
                      SizedBox(
                        height: 5.h,
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    dash.screenTabs(dash.currenttab = 2);
                  },
                  child: Column(
                    spacing: 5.h,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 2.h,
                        width: 50.w,
                        child: DecoratedBox(
                            decoration: BoxDecoration(
                                color: dash.currenttab == 2
                                    ? CleanerAppcolors.primarybrowncolor
                                    : null)),
                      ),
                      Image.asset(
                        AppIcons.myordersicon,
                        height: 20.h,
                        color: dash.currenttab == 2
                            ? CleanerAppcolors.primarybrowncolor
                            : null,
                      ),
                      Text(
                        'My Orders',
                        style: dash.currenttab == 2
                            ? dashboardlablefontbrown
                            : dashboardlabelfontblack,
                      ),
                      SizedBox(
                        height: 5.h,
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    dash.screenTabs(dash.currenttab = 3);
                  },
                  child: Column(
                    spacing: 5.h,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 2.h,
                        width: 50.w,
                        child: DecoratedBox(
                            decoration: BoxDecoration(
                                color: dash.currenttab == 3
                                    ? CleanerAppcolors.primarybrowncolor
                                    : null)),
                      ),
                      Image.asset(AppIcons.profileicon,
                          height: 20.h,
                          color: dash.currenttab == 3
                              ? CleanerAppcolors.primarybrowncolor
                              : null),
                      Text(
                        'Profile',
                        style: dash.currenttab == 3
                            ? dashboardlablefontbrown
                            : dashboardlabelfontblack,
                      ),
                      SizedBox(
                        height: 5.h,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          body: dash.screens[dash.currenttab],
        );
      },
    );
  }
}
