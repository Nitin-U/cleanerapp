import 'package:cleanerapp/utils/appcolors.dart';
import 'package:cleanerapp/utils/style.dart';
import 'package:cleanerapp/view/dashboard_screens/bin_request/bin_request_provider/bin_request_provider.dart';
import 'package:cleanerapp/view/dashboard_screens/bin_request/bin_request_tab/bin_request_tabs.dart';
import 'package:cleanerapp/view/dashboard_screens/home/components/my_orders_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../home/home_provider/home_provider.dart';

class BinRequestView extends StatelessWidget {
  const BinRequestView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: CleanerAppcolors.primarylightgreycolor,
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text('Bin Request', style: appbartitlefont),
        ),
        backgroundColor: CleanerAppcolors.primarylightgreycolor,
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: Column(
              spacing: 15.h,
              children: [
                BinRequestTabs(),
                Column(
                  spacing: 15.h,
                  children: List.generate(
                    6,
                    (index) => MyOrdersCard(),
                  ),
                ),
              ],
            )));
  }
}
