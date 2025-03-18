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
          minLeadingWidth: 1,
          contentPadding: EdgeInsets.all(0),
          leading: Text(
            '01',
            style: dashboardlabelfontblack,
          ),
          title: Text(
            'Up Coming orders',
            style: listiletitlefont,
          ),
        ),
      ],
    );
  }
}
