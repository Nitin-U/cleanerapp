import 'package:cleanerapp/custom_widget/cleaner_textfield.dart';
import 'package:cleanerapp/utils/appcolors.dart';
import 'package:cleanerapp/utils/style.dart';
import 'package:cleanerapp/view/dashboard_screens/home/components/cleaner_app_drawer/cleaner_app_drawer.dart';
import 'package:cleanerapp/view/dashboard_screens/home/components/greetings_card.dart';
import 'package:cleanerapp/view/dashboard_screens/home/components/my_orders_list/my_orders_list.dart';
import 'package:cleanerapp/view/dashboard_screens/home/components/orders_tabs/orders_tabs.dart';
import 'package:cleanerapp/view/dashboard_screens/home/components/upcoming_orders_list/upcoming_order_list.dart';
import 'package:cleanerapp/view/dashboard_screens/home/home_provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, home, child) {
        return Scaffold(
          drawer: CleanerAppDrawer(),
          appBar: AppBar(
            leading: Builder(
              builder: (context) => GestureDetector(
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                  child: Icon(Icons.menu)),
            ),
            actions: [
              Icon(Icons.notifications),
              SizedBox(
                width: 12.w,
              )
            ],
            backgroundColor: CleanerAppcolors.primarylightgreycolor,
            automaticallyImplyLeading: false,
          ),
          backgroundColor: CleanerAppcolors.primarylightgreycolor,
          body: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10.h,
                children: [
                  CleanerTextfield(
                      prefix: Icon(Icons.search), hintlabel: 'Search'),
                  GreetingsCard(),
                  Text(
                    'Active Orders',
                    style: greetingsStyleblack,
                  ),
                  OrdersTabs(),
                  if (home.tabs == 0) MyOrders(),
                  if (home.tabs == 1) UpComingOrders()
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
