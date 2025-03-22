import 'package:cleanerapp/custom_widget/custom_tile.dart';
import 'package:cleanerapp/utils/appcolors.dart';
import 'package:cleanerapp/utils/cleanericonspng.dart';
import 'package:cleanerapp/utils/style.dart';
import 'package:cleanerapp/view/dashboard_screens/profile/components/profile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: CleanerAppcolors.primarylightgreycolor,
        title: Text(
          'Profile',
          style: appbartitlefont,
        ),
      ),
      backgroundColor: CleanerAppcolors.primarylightgreycolor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.w),
        child: Column(
          spacing: 10.h,
          children: [
            ProfileCard(),
            Divider(),
            CustomListtile(
              leading: Image.asset(
                AppIcons.myordersicon,
                height: 30.h,
              ),
              title: 'My Orders',
              subtitle: '20',
            ),
            CustomListtile(
              leading: Icon(
                Icons.place_outlined,
                size: 30.h,
              ),
              title: 'Address',
              subtitle: 'Dhapakhel, Lalitpur',
            ),
            CustomListtile(
                leading: Icon(
                  Icons.phone_outlined,
                  size: 30.h,
                ),
                title: 'Contact',
                subtitle: '983844557'),
          ],
        ),
      ),
    );
  }
}
