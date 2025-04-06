import 'package:cleanerapp/custom_widget/cleaner_chip.dart';
import 'package:cleanerapp/utils/appcolors.dart';
import 'package:cleanerapp/utils/style.dart';
import 'package:cleanerapp/view/authentication/login/login_provider/login_provider.dart';
import 'package:cleanerapp/view/dashboard_screens/home/home_provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class GreetingsCard extends StatelessWidget {
  const GreetingsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, home, child) {
        return Consumer<LoginProvider>(
          builder: (context, log, child) {
            return SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: DecoratedBox(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      CleanerAppcolors.primarylightbrowncolor,
                      CleanerAppcolors.primarybrowncolor
                    ]),
                    borderRadius: BorderRadius.circular(20.r)),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 22).r,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        home.getGreeting(),
                        style: buttonfond,
                      ),
                      SizedBox(
                        height: 5.r,
                      ),
                      Text(
                        log.user?.data?.user?.name ?? '',
                        style: drivernamefont,
                      ),
                      SizedBox(
                        height: 15.r,
                      ),
                      CleanerWhiteFontChip(
                        label: 'My Orders',
                        backgroundColor: CleanerAppcolors.primarybrowncolor,
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
