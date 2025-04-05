import 'package:cleanerapp/utils/style.dart';
import 'package:cleanerapp/view/authentication/login/login_provider/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(
      builder: (context, log, child) {
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
                      log.user?.data?.user?.name??'',
                      style: listiletitlefont,
                    ),
                    SizedBox(
                      width: 180.r,
                      child: Text(
                       log.user?.data?.user?.email??'',
                        style: dashboardlablefontgrey,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
