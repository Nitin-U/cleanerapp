import 'package:binbookingapp/custom_widget/transaction_route.dart';
import 'package:binbookingapp/view/dashboard_screens/my_orders/components/my_orders_card.dart';
import 'package:binbookingapp/view/dashboard_screens/my_orders/detailscreen/my_orders_pickup_details_screen.dart';
import 'package:binbookingapp/view/dashboard_screens/my_orders/my_orders_provider/my_order_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class MyOrdersPickUpList extends StatelessWidget {
  const MyOrdersPickUpList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MyOrderProvider>(
      builder: (context, order, child) {
        return Column(
          spacing: 15.r,
          children: List.generate(order.order?.data.siteRequests.length ?? 0, (
            index,
          ) {
            var sitedata = order.order?.data.siteRequests[index];
            return MyOrdersCard(
              onPressed: () {
                Navigator.push(
                  context,
                  CustomPageRoute(
                    child: MyOrdersPickupDetailsScreen(
                      binsizename: sitedata?.binSizeName??'',
                      duration: sitedata?.orderDuration.toString()??'',
                      customername: sitedata?.customerName ?? '',
                      startDate: sitedata?.startDate ?? '',
                      endate: sitedata?.endDate ?? '',
                      quantity: sitedata?.quantity ?? 0, location: sitedata?.location??'',
                    ),
                  ),
                );
              },
              address: sitedata?.location ?? '',
              quantity: sitedata?.quantity.toString() ?? '',
              startdate: sitedata?.startDate ?? '',
              endDate: sitedata?.endDate ?? '',
              binsizename: sitedata?.binSizeName ?? '',
            );
          }),
        );
      },
    );
  }
}
