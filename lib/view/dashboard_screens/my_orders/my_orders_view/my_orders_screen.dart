import 'package:cleanerapp/utils/appcolors.dart';
import 'package:cleanerapp/utils/style.dart';
import 'package:cleanerapp/view/dashboard_screens/home/components/my_orders_list/my_orders_list.dart';
import 'package:cleanerapp/view/dashboard_screens/home/components/upcoming_orders_list/upcoming_order_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'My Orders',
            style: resendfont,
          ),
          bottom: TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              indicator:
                  BoxDecoration(color: CleanerAppcolors.primarybrowncolor),
              labelStyle: tabfonts,
              tabs: [
                Tab(
                  text: 'My Orders',
                ),
                Tab(
                  text: 'Upcoming Orders',
                )
              ]),
          backgroundColor: CleanerAppcolors.primarylightgreycolor,
        ),
        backgroundColor: CleanerAppcolors.primarylightgreycolor,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
          child: TabBarView(children: [MyOrders(), UpComingOrders()]),
        ),
      ),
    );
  }
}
