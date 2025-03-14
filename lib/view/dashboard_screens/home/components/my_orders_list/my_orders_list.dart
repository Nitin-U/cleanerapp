import 'package:cleanerapp/utils/style.dart';
import 'package:flutter/material.dart';

class MyOrders extends StatelessWidget {
  const MyOrders({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.all(0),
          leading: Icon(Icons.history),
          title: Text(
            'My Orders',
            style: dashboardlabelfontblack,
          ),
        ),
      ],
    );
  }
}