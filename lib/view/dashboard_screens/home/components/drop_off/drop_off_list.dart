import 'package:cleanerapp/utils/appcolors.dart';
import 'package:cleanerapp/utils/style.dart';
import 'package:cleanerapp/view/dashboard/dashboard_provider/dashboard_provider.dart';
import 'package:cleanerapp/view/dashboard_screens/bin_request/bin_request_provider/bin_request_provider.dart';
import 'package:cleanerapp/view/dashboard_screens/bin_request/components/bin_request_card.dart';
import 'package:cleanerapp/view/dashboard_screens/my_orders/components/my_orders_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

class DropOff extends StatelessWidget {
  const DropOff({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(
      builder: (context, dash, child) {
        return Consumer<BinRequestProvider>(
          builder: (context, bindata, child) {
            return bindata.loadingbinbooking == true
                ? LoadingAnimationWidget.hexagonDots(
                    color: CleanerAppcolors.primarybrowncolor, size: 20.r)
                : Column(
                    spacing: 15.r,
                    children: [
                      ...List.generate(
                          (bindata.binbook?.data.warehouseRequests.length ??
                                      0) >
                                  6
                              ? 6
                              : (bindata
                                      .binbook?.data.warehouseRequests.length ??
                                  0), (index) {
                        final waredata =
                            bindata.binbook?.data.warehouseRequests[index];
                        return BinRequestCard(
                          quantity: waredata?.quantity.toString() ?? '0',
                          address: waredata?.location ?? 'N/A',
                          startdate: waredata?.startDate ?? 'N/A',
                          binsizename: waredata?.binSizeName ?? 'N/A',
                          duration: waredata?.orderDuration.toString() ?? '',
                        );
                      }),
                      if ((bindata.binbook?.data.warehouseRequests.length ??
                              0) >
                          6)
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
      },
    );
  }
}
