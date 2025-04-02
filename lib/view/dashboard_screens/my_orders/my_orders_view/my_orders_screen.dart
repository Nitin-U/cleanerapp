import 'package:cleanerapp/utils/appcolors.dart';
import 'package:cleanerapp/utils/style.dart';
import 'package:cleanerapp/view/dashboard_screens/home/components/my_orders_card.dart';
import 'package:cleanerapp/view/dashboard_screens/my_orders/my_orders_provider/myorders_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MyordersProviders>(
      builder: (context, orders, child) {
        return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              centerTitle: true,
              title: Text(
                'My Orders',
                style: appbartitlefont,
              ),
              backgroundColor: CleanerAppcolors.primarylightgreycolor,
            ),
            backgroundColor: CleanerAppcolors.primarylightgreycolor,
            body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: SingleChildScrollView(
                  child: Column(
                    spacing: 15.h,
                    children: List.generate(
                      orders.ordersData.length,
                      (index) => MyOrdersCard(),
                    ),
                  ),
                )));
      },
    );
  }
}
