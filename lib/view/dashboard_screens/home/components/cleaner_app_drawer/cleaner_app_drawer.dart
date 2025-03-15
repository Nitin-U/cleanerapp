import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/style.dart';

class CleanerAppDrawer extends StatelessWidget {
  const CleanerAppDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 220,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 50.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Aakash'),
            ListTile(
              contentPadding: EdgeInsets.all(0),
              leading: Icon(Icons.history),
              title: Text(
                'My Orders',
                style: dashboardlabelfontblack,
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.all(0),
              leading: Icon(Icons.notifications),
              title: Text(
                'Notifications',
                style: dashboardlabelfontblack,
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.all(0),
              leading: Icon(Icons.logout),
              title: Text(
                'Logout',
                style: dashboardlabelfontblack,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
