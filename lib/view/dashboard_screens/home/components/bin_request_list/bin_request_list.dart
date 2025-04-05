import 'package:cleanerapp/utils/style.dart';
import 'package:cleanerapp/view/dashboard/dashboard_provider/dashboard_provider.dart';
import 'package:cleanerapp/view/dashboard_screens/bin_request/bin_request_provider/bin_request_provider.dart';
import 'package:cleanerapp/view/dashboard_screens/home/components/my_orders_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class BinRequests extends StatelessWidget {
  // Assuming this is the list of orders

  const BinRequests({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(
      builder: (context, dash, child) {
        var bindata = Provider.of<BinRequestProvider>(context, listen: false);
        return Column(
          spacing: 15.r,
          children: [
            ...List.generate(
              (bindata.binbook?.binBookings?.length ?? 0) > 6
                  ? 6
                  : (bindata.binbook?.binBookings?.length ?? 0),
              (index) {
                var data = bindata.binbook?.binBookings?[index];
                return MyOrdersCard(
                  name: data?.customerName ?? 'N/A',
                  address: data?.customerAddress ?? 'N/A',
                  quantity: data?.quantity.toString() ?? 'N/A',
                  startdate: data?.startDate ?? 'N/A',
                  enddate: data?.endDate ?? 'N/A',
                  contact: data?.customerContact ?? 'N/A',
                  email: data?.customerEmail ?? 'N/A',
                );
              },
            ),
            if ((bindata.binbook?.binBookings?.length ?? 0) > 6)
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
