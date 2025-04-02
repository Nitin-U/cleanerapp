import 'package:cleanerapp/utils/style.dart';
import 'package:cleanerapp/view/dashboard/dashboard_provider/dashboard_provider.dart';
import 'package:cleanerapp/view/dashboard_screens/home/components/my_orders_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class BinRequests extends StatelessWidget {
  final List<dynamic> orders; // Assuming this is the list of orders

  const BinRequests({
    super.key,
    required this.orders,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(
      builder: (context, dash, child) {
        return Column(
          spacing: 15.r,
          children: [
            ...List.generate(
              orders.length > 6 ? 6 : orders.length,
              (index) => MyOrdersCard(),
            ),
            if (orders.length > 6)
              GestureDetector(
                onTap: () {
                  dash.screenTabs(dash.currenttab = 1);
                },
                child: Text(
                  'See all',
                  style: seeallfont,
                ),
              )
          ],
        );
      },
    );
  }
}
