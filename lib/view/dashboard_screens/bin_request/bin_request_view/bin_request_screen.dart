import 'package:cleanerapp/utils/appcolors.dart';
import 'package:cleanerapp/utils/style.dart';
import 'package:cleanerapp/view/dashboard_screens/bin_request/bin_request_provider/bin_request_provider.dart';
import 'package:cleanerapp/view/dashboard_screens/bin_request/bin_request_tab/bin_request_tabs.dart';
import 'package:cleanerapp/view/dashboard_screens/home/components/my_orders_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class BinRequestView extends StatelessWidget {
  const BinRequestView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BinRequestProvider>(
      builder: (context, binr, child) {
        return Scaffold(
            appBar: AppBar(
              backgroundColor: CleanerAppcolors.primarylightgreycolor,
              centerTitle: true,
              automaticallyImplyLeading: false,
              title: Text('Bin Request', style: appbartitlefont),
            ),
            backgroundColor: CleanerAppcolors.primarylightgreycolor,
            body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10).r,
                child: SingleChildScrollView(
                  child: Column(
                    spacing: 15.r,
                    children: [
                      BinRequestTabs(),
                      if (binr.currenttab == 0)
                        Column(
                          spacing: 15.r,
                          children: List.generate(
                              binr.binbook?.binBookings?.length ?? 0, (index) {
                            var bindata = binr.binbook?.binBookings?[index];
                            return MyOrdersCard(
                              name: bindata?.customerName ?? 'N/A',
                              address: bindata?.customerAddress ?? 'N/A',
                              quantity: bindata?.quantity.toString() ?? '0',
                              startdate: bindata?.startDate ?? '',
                              enddate: bindata?.endDate ?? '',
                            );
                          }),
                        ),
                      if (binr.currenttab == 1)
                        Column(
                          spacing: 15.r,
                          children: List.generate(6, (index) {
                            return MyOrdersCard(
                              name: '',
                              address: '',
                              quantity: '',
                              startdate: '',
                              enddate: '',
                            );
                          }),
                        ),
                    ],
                  ),
                )));
      },
    );
  }
}
