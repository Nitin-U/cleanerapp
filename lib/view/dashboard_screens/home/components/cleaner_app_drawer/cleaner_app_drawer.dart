import 'package:cleanerapp/custom_widget/custom_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            CustomListtile(
              leading: Icon(
                Icons.notifications_none,
                size: 18.r,
              ),
              title: 'Notification',
            )
          ],
        ),
      ),
    );
  }
}
