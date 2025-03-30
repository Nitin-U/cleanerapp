import 'package:cleanerapp/utils/appcolors.dart';
import 'package:cleanerapp/utils/style.dart';
import 'package:cleanerapp/view/dashboard_screens/home/components/my_orders_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
            child: Column(
              spacing: 15.h,
              children: List.generate(
                6,
                (index) => MyOrdersCard(),
              ),
            )));
  }
}
