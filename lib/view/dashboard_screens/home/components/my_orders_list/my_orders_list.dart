
import 'package:cleanerapp/view/dashboard_screens/home/components/my_orders_card.dart';
import 'package:flutter/material.dart';

class MyOrders extends StatelessWidget {
  const MyOrders({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [MyOrdersCard()],
    );
  }
}

