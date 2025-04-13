import 'package:binbookingapp/custom_widget/transaction_route.dart';
import 'package:binbookingapp/view/dashboard_screens/my_orders/components/my_orders_card.dart';
import 'package:binbookingapp/view/dashboard_screens/my_orders/detailscreen/my_orders_drop_off_details_screen.dart';
import 'package:binbookingapp/view/dashboard_screens/my_orders/my_orders_provider/my_order_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class MyOrdersDropOffList extends StatelessWidget {
  const MyOrdersDropOffList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MyOrderProvider>(
      builder: (context, order, child) {
        return Column(
          spacing: 15.r,
          children: List.generate(
            order.order?.data.warehouseRequests.length??0,
            (index) {
             var waredata = order.order?.data.warehouseRequests[index];
              return MyOrdersCard(
                onPressed: () {
                  Navigator.push(context, CustomPageRoute(child: MyOrdersDropOffDetailsScreen()));
                },
              address: waredata?.location??'',
              quantity: waredata?.quantity.toString()??'',
              startdate: waredata?.startDate??'',
              endDate: waredata?.endDate??'',
              binsizename: waredata?.binSizeName??'',
            );
            }
          ),
        );
      },
    );
  }
}
