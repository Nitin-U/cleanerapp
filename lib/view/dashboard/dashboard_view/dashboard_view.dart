import 'package:cleanerapp/utils/appcolors.dart';
import 'package:cleanerapp/utils/cleanericonspng.dart';
import 'package:cleanerapp/utils/style.dart';
import 'package:cleanerapp/view/authentication/login/login_provider/login_provider.dart';
import 'package:cleanerapp/view/dashboard/dashboard_provider/dashboard_provider.dart';
import 'package:cleanerapp/view/dashboard_screens/bin_request/bin_request_provider/bin_request_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getData();
    });
  }

  void getData() async {
    final logindata = Provider.of<LoginProvider>(context, listen: false);
    final binrequestdata =
        Provider.of<BinRequestProvider>(context, listen: false);
    await binrequestdata.getBinRequestData(logindata.user?.data?.token ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(
      builder: (context, dash, child) {
        return Scaffold(
          backgroundColor: CleanerAppcolors.primarylightgreycolor,
          bottomNavigationBar: DecoratedBox(
            decoration: BoxDecoration(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15).r,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      dash.screenTabs(dash.currenttab = 0);
                    },
                    child: DecoratedBox(
                      decoration: BoxDecoration(),
                      child: Column(
                        spacing: 5.r,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: 2.r,
                            width: 50.r,
                            child: DecoratedBox(
                                decoration: BoxDecoration(
                                    color: dash.currenttab == 0
                                        ? CleanerAppcolors.primarybrowncolor
                                        : null)),
                          ),
                          Image.asset(
                            AppIcons.homeicon,
                            height: 20.r,
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
                            height: 5.r,
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      dash.screenTabs(dash.currenttab = 1);
                    },
                    child: DecoratedBox(
                      decoration: BoxDecoration(),
                      child: Column(
                        spacing: 5.r,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: 2.r,
                            width: 50.r,
                            child: DecoratedBox(
                                decoration: BoxDecoration(
                                    color: dash.currenttab == 1
                                        ? CleanerAppcolors.primarybrowncolor
                                        : null)),
                          ),
                          Image.asset(
                            AppIcons.requesticon,
                            height: 20.r,
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
                            height: 5.r,
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      dash.screenTabs(dash.currenttab = 2);
                    },
                    child: DecoratedBox(
                      decoration: BoxDecoration(),
                      child: Column(
                        spacing: 5.r,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: 2.r,
                            width: 50.r,
                            child: DecoratedBox(
                                decoration: BoxDecoration(
                                    color: dash.currenttab == 2
                                        ? CleanerAppcolors.primarybrowncolor
                                        : null)),
                          ),
                          Image.asset(
                            AppIcons.myordersicon,
                            height: 20.r,
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
                            height: 5.r,
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      dash.screenTabs(dash.currenttab = 3);
                    },
                    child: DecoratedBox(
                      decoration: BoxDecoration(),
                      child: Column(
                        spacing: 5.r,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: 2.r,
                            width: 50.r,
                            child: DecoratedBox(
                                decoration: BoxDecoration(
                                    color: dash.currenttab == 3
                                        ? CleanerAppcolors.primarybrowncolor
                                        : null)),
                          ),
                          Image.asset(AppIcons.profileicon,
                              height: 20.r,
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
                            height: 5.r,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: dash.screens[dash.currenttab],
        );
      },
    );
  }
}
