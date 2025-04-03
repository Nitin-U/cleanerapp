import 'package:cleanerapp/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: DecoratedBox(
        decoration: BoxDecoration(),
        child: Row(
          spacing: 12.r,
          children: [
            CircleAvatar(
              child: Icon(Icons.person),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Aakash Sunar',
                  style: listiletitlefont,
                ),
                SizedBox(
                  width: 180.r,
                  child: Text(
                    'aakashsharma73235@gmail.com',
                    style: dashboardlablefontgrey,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
