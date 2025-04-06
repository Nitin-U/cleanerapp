import 'package:cleanerapp/utils/style.dart';
import 'package:cleanerapp/view/dashboard/dashboard_provider/dashboard_provider.dart';
import 'package:cleanerapp/view/dashboard_screens/bin_request/bin_request_provider/bin_request_provider.dart';
import 'package:cleanerapp/view/dashboard_screens/home/components/my_orders_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class DropOff extends StatelessWidget {

  const DropOff({
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
              bindata.binRequestData.length > 6 ? 6 :bindata.binRequestData.length,
              (index) => MyOrdersCard(name: '', quantity: '', address: '', startdate: '', enddate: '',  ),
            ),
            if (bindata.binRequestData.length> 6)
              GestureDetector(
                onTap: () {
                  dash.screenTabs(dash.currenttab = 2);
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
