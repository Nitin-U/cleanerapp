import 'package:cleanerapp/utils/appcolors.dart';
import 'package:cleanerapp/utils/style.dart';
import 'package:cleanerapp/view/dashboard/dashboard_provider/dashboard_provider.dart';
import 'package:cleanerapp/view/dashboard_screens/bin_request/bin_request_provider/bin_request_provider.dart';
import 'package:cleanerapp/view/dashboard_screens/bin_request/components/bin_request_card.dart';
import 'package:cleanerapp/view/dashboard_screens/home/components/cleanerapp_bottom_sheet/cleanerapp_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

class PickUp extends StatelessWidget {
  const PickUp({
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
                        (bindata.binbook?.data.siteRequests.length ?? 0) > 6
                            ? 6
                            : (bindata.binbook?.data.siteRequests.length ?? 0),
                        (index) {
                          var data = bindata.binbook?.data.siteRequests[index];
                          return BinRequestCard(
                            onPressed: () {
                              showModalBottomSheet(
                                showDragHandle: true,
                                context: context,
                                builder: (context) {
                                  return CleanerAppBottomSheet();
                                },
                              );
                            },
                            address: data?.location ?? 'N/A',
                            quantity: data?.quantity.toString() ?? 'N/A',
                            startdate: data?.startDate ?? 'N/A',
                            duration: data?.orderDuration.toString() ?? 'N/A',
                            binsizename: data?.binSizeName ?? '',
                          );
                        },
                      ),
                      if ((bindata.binbook?.data.siteRequests.length ?? 0) > 6)
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
      },
    );
  }
}
