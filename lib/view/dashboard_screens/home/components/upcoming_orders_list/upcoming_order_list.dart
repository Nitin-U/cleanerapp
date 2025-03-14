import 'package:cleanerapp/utils/style.dart';
import 'package:flutter/material.dart';

class UpComingOrders extends StatelessWidget {
  const UpComingOrders({
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
            'Up Coming orders',
            style: dashboardlabelfontblack,
          ),
        ),
      ],
    );
  }
}
