import 'package:cleanerapp/utils/appcolors.dart';
import 'package:cleanerapp/utils/style.dart';
import 'package:cleanerapp/view/dashboard/dashboard_provider/dashboard_provider.dart';
import 'package:flutter/material.dart';
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
                                    ? CleanerAppcolors.primaryGreencolor
                                    : null)),
                      ),
                      Icon(
                        Icons.home,
                        size: 17,
                        color: dash.currenttab == 0
                            ? CleanerAppcolors.primaryGreencolor
                            : Colors.black,
                      ),
                      Text(
                        'Home',
                        style: dash.currenttab == 0
                            ? dashboardlablefontgreen
                            : dashboardlabelfontblack,
                      ),
                      SizedBox(
                        height: 5,
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
                        height: 2,
                        width: 50,
                        child: DecoratedBox(
                            decoration: BoxDecoration(
                                color: dash.currenttab == 1
                                    ? CleanerAppcolors.primaryGreencolor
                                    : null)),
                      ),
                      Icon(
                        Icons.check_circle_sharp,
                        size: 17,
                        color: dash.currenttab == 1
                            ? CleanerAppcolors.primaryGreencolor
                            : Colors.black,
                      ),
                      Text(
                        'Active Orders',
                        style: dash.currenttab == 1
                            ? dashboardlablefontgreen
                            : dashboardlabelfontblack,
                      ),
                      SizedBox(
                        height: 5,
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    dash.screenTabs(dash.currenttab = 2);
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
                                color: dash.currenttab == 2
                                    ? CleanerAppcolors.primaryGreencolor
                                    : null)),
                      ),
                      Icon(
                        Icons.history,
                        size: 17,
                        color: dash.currenttab == 2
                            ? CleanerAppcolors.primaryGreencolor
                            : Colors.black,
                      ),
                      Text(
                        'My Orders',
                        style: dash.currenttab == 2
                            ? dashboardlablefontgreen
                            : dashboardlabelfontblack,
                      ),
                      SizedBox(
                        height: 5,
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    dash.screenTabs(dash.currenttab = 3);
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
                                color: dash.currenttab == 3
                                    ? CleanerAppcolors.primaryGreencolor
                                    : null)),
                      ),
                      Icon(
                        Icons.person,
                        size: 17,
                        color: dash.currenttab == 3
                            ? CleanerAppcolors.primaryGreencolor
                            : Colors.black,
                      ),
                      Text(
                        'Profile',
                        style: dash.currenttab == 3
                            ? dashboardlablefontgreen
                            : dashboardlabelfontblack,
                      ),
                      SizedBox(
                        height: 5,
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
