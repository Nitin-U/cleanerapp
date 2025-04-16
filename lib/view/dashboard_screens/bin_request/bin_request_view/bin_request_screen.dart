
import 'package:binbookingapp/utils/appcolors.dart';
import 'package:binbookingapp/utils/style.dart' show appbartitlefont;
import 'package:binbookingapp/view/authentication/login/login_provider/login_provider.dart';
import 'package:binbookingapp/view/dashboard_screens/bin_request/bin_request_provider/bin_request_provider.dart';
import 'package:binbookingapp/view/dashboard_screens/bin_request/bin_request_tab/bin_request_tabs.dart';
import 'package:binbookingapp/view/dashboard_screens/bin_request/components/bin_request_card.dart';
import 'package:binbookingapp/view/dashboard_screens/home/components/bin_booking_bottom_sheet/bin_booking_bottom_sheet.dart' show BinBookingBottomSheet;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

class BinRequestView extends StatelessWidget {
  const BinRequestView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BinRequestProvider>(
      builder: (context, binr, child) {
        return Consumer<LoginProvider>(builder: (context, log, child) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: CleanerAppcolors.primaryminigreycolor,
              centerTitle: true,
              automaticallyImplyLeading: false,
              title: Text('Bin Request', style: appbartitlefont),
            ),
            backgroundColor: CleanerAppcolors.primaryminigreycolor,
            body: binr.loadingbinbooking == true
                ? LoadingAnimationWidget.hexagonDots(
                    color: CleanerAppcolors.primarybrowncolor, size: 30.r)
                : Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 10).r,
                    child: SingleChildScrollView(
                      child: Column(
                        spacing: 15.r,
                        children: [
                          BinRequestTabs(),
                          if (binr.currenttab == 0)
                            Column(
                              spacing: 15.r,
                              children: List.generate(
                                  binr.binbook?.data.siteRequests.length ?? 0,
                                  (index) {
                                var bindata =
                                    binr.binbook?.data.siteRequests[index];
                                return BinRequestCard(
                                  onPressed: () {
                                    showModalBottomSheet(
                                      showDragHandle: true,
                                      context: context,
                                      builder: (context) {
                                        return BinBookingBottomSheet(
                                            customername:
                                                bindata?.customerName ?? '',
                                            location: bindata?.location ?? '',
                                            endDate: bindata?.endDate ?? '',
                                            type: bindata?.type ?? '',
                                            binsizeName:
                                                bindata?.binSizeName ?? '', bookingId: bindata?.id.toString()??'', userId: bindata?.id.toString()??'',);
                                      },
                                    );
                                  },
                                  address: bindata?.location ?? 'N/A',
                                  quantity: bindata?.quantity.toString() ?? '0',
                                  startdate: bindata?.startDate ?? '',
                                  duration: bindata?.endDate ?? '0',
                                  binsizename: '',
                                );
                              }),
                            ),
                          if (binr.currenttab == 1)
                            Column(
                              spacing: 15.r,
                              children: List.generate(
                                  binr.binbook?.data.warehouseRequests.length ??
                                      0, (index) {
                                final waredata =
                                    binr.binbook?.data.warehouseRequests[index];
                                return BinRequestCard(
                                  onPressed: () {
                                    showModalBottomSheet(
                                      showDragHandle: true,
                                      context: context,
                                      builder: (context) {
                                        return BinBookingBottomSheet(
                                            customername:
                                                waredata?.customerName ?? '',
                                            location: waredata?.location ?? '',
                                            endDate: waredata?.endDate ?? '',
                                            type: waredata?.type ?? '',
                                            binsizeName:
                                                waredata?.binSizeName ?? '', bookingId:waredata?.id.toString()??'', userId: waredata?.id.toString()??'',);
                                      },
                                    );
                                  },
                                  address: waredata?.location ?? 'N/A',
                                  quantity: waredata?.quantity.toString() ?? '',
                                  startdate: waredata?.startDate ?? '',
                                  duration:
                                      waredata?.orderDuration.toString() ?? '',
                                  binsizename: waredata?.binSizeName ?? '',
                                );
                              }),
                            ),
                        ],
                      ),
                    )));
        },);
      },
    );
  }
}
