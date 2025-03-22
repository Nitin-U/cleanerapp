import 'package:cleanerapp/custom_widget/custom_tile.dart';
import 'package:cleanerapp/utils/cleanericonspng.dart';
import 'package:cleanerapp/view/dashboard_screens/profile/components/profile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CleanerAppDrawer extends StatelessWidget {
  const CleanerAppDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 350.w,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 90.h),
        child: Column(
          spacing: 10.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileCard(),
            CustomListtile(
              leading: Icon(
                Icons.notifications_none,
                size: 18.r,
              ),
              title: 'Notification',
            ),
            CustomListtile(
              leading: Image.asset(
                AppIcons.myordersicon,
                height: 20.h,
              ),
              title: 'My Orders',
            ),
            CustomListtile(
              leading: Icon(
                Icons.logout,
                size: 18.r,
              ),
              title: 'Logout',
            ),
          ],
        ),
      ),
    );
  }
}
