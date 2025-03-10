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
                  child: Column(
                    children: [
                      Icon(
                        Icons.home,
                        color:
                            dash.currenttab == 0 ? Colors.green : Colors.black,
                      ),
                      Text(
                        'Home',
                        style: dash.currenttab == 0
                            ? dashboardlablefontgreen
                            : dashboardlabelfontblack,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    dash.screenTabs(dash.currenttab = 1);
                  },
                  child: Column(
                    children: [
                      Icon(
                        Icons.check_circle,
                        color:
                            dash.currenttab == 1 ? Colors.green : Colors.black,
                      ),
                      Text(
                        'Active orders',
                        style: dash.currenttab == 1
                            ? dashboardlablefontgreen
                            : dashboardlabelfontblack,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    dash.screenTabs(dash.currenttab = 2);
                  },
                  child: Column(
                    children: [
                      Icon(
                        Icons.history,
                        color:
                            dash.currenttab == 2 ? Colors.green : Colors.black,
                      ),
                      Text(
                        'My Orders',
                        style: dash.currenttab == 2
                            ? dashboardlablefontgreen
                            : dashboardlabelfontblack,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    dash.screenTabs(dash.currenttab = 3);
                  },
                  child: Column(
                    children: [
                      Icon(
                        Icons.person_pin,
                        color:
                            dash.currenttab == 3 ? Colors.green : Colors.black,
                      ),
                      Text(
                        'Profile',
                        style: dash.currenttab == 3
                            ? dashboardlablefontgreen
                            : dashboardlabelfontblack,
                      ),
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
