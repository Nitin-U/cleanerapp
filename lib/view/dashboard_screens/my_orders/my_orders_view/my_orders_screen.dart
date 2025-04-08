import 'package:cleanerapp/utils/appcolors.dart';
import 'package:cleanerapp/utils/style.dart';
import 'package:cleanerapp/view/dashboard_screens/my_orders/components/my_orders_card.dart';
import 'package:cleanerapp/view/dashboard_screens/my_orders/my_orders_provider/my_order_provider.dart';
import 'package:cleanerapp/view/dashboard_screens/profile/components/my_order_tabs/my_orders_tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MyOrderProvider>(
      builder: (context, orders, child) {
        return Scaffold(
            appBar: AppBar(
              scrolledUnderElevation: 0,
              automaticallyImplyLeading: false,
              centerTitle: true,
              title: Text(
                'My Orders',
                style: appbartitlefont,
              ),
              backgroundColor: CleanerAppcolors.primaryminigreycolor,
            ),
            backgroundColor: CleanerAppcolors.primaryminigreycolor,
            body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10).r,
                child: SingleChildScrollView(
                  child: Column(
                    spacing: 15.r,
                    children: [
                      MyOrdersTabs(),
                      Column(
                        spacing: 15.r,
                        children: List.generate(
                          6,
                          (index) => MyOrdersCard(
                            address: '',
                            quantity: '',
                            startdate: '',
                            endDate: '',
                            binsizename: '',
                          ),
                        ),
                      ),
                    ],
                  ),
                )));
      },
    );
  }
}
