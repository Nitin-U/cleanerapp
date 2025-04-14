
import 'package:binbookingapp/custom_widget/custom_tile.dart';
import 'package:binbookingapp/utils/cleanericonspng.dart';
import 'package:binbookingapp/view/dashboard_screens/profile/components/profile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CleanerAppDrawer extends StatelessWidget {
  const CleanerAppDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 350.r,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 90).r,
        child: Column(
          spacing: 15.r,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileCard(),
            CustomListtile(
              leading: Image.asset(
                AppIcons.requesticon,
                height: 20.r,
              ),
              title: 'Bin Request',
            ),
            CustomListtile(
              leading: Image.asset(
                AppIcons.myordersicon,
                height: 20.r,
              ),
              title: 'My Orders',
            ),
            CustomListtile(
              leading: Icon(
                Icons.logout,
                size: 20.r,
              ),
              title: 'Logout',
            ),
          ],
        ),
      ),
    );
  }
}
