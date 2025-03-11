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
          bottomNavigationBar: BottomAppBar(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    dash.screenTabs(dash.currenttab = 0);
                  },
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: dash.currenttab == 0 ? Colors.green : null),
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.home,
                            size: 17,
                            color: dash.currenttab == 0
                                ? Colors.white
                                : Colors.black,
                          ),
                          Text(
                            'Home',
                            style: dash.currenttab == 0
                                ? dashboardlablefontwhite
                                : dashboardlabelfontblack,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    dash.screenTabs(dash.currenttab = 1);
                  },
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: dash.currenttab == 1 ? Colors.green : null),
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.check_circle,
                            size: 17,
                            color: dash.currenttab == 1
                                ? Colors.white
                                : Colors.black,
                          ),
                          Text(
                            'Active Orders',
                            style: dash.currenttab == 1
                                ? dashboardlablefontwhite
                                : dashboardlabelfontblack,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    dash.screenTabs(dash.currenttab = 2);
                  },
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: dash.currenttab == 2 ? Colors.green : null),
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.history,
                            size: 17,
                            color: dash.currenttab == 2
                                ? Colors.white
                                : Colors.black,
                          ),
                          Text(
                            'My Orders',
                            style: dash.currenttab == 2
                                ? dashboardlablefontwhite
                                : dashboardlabelfontblack,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    dash.screenTabs(dash.currenttab = 3);
                  },
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: dash.currenttab == 3 ? Colors.green : null),
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.person,
                            size: 17,
                            color: dash.currenttab == 3
                                ? Colors.white
                                : Colors.black,
                          ),
                          Text(
                            'Profile',
                            style: dash.currenttab == 3
                                ? dashboardlablefontwhite
                                : dashboardlabelfontblack,
                          ),
                        ],
                      ),
                    ),
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
