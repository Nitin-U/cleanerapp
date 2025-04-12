
import 'package:binbookingapp/custom_widget/cleaner_chip.dart';
import 'package:binbookingapp/utils/appcolors.dart';
import 'package:binbookingapp/utils/style.dart';
import 'package:binbookingapp/view/authentication/login/login_provider/login_provider.dart' show LoginProvider;
import 'package:binbookingapp/view/dashboard_screens/home/home_provider/home_provider.dart';
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
                      CleanerAppcolors.primarylightpurple,
                      CleanerAppcolors.primarypurple
                    ]),
                    borderRadius: BorderRadius.circular(20.r)),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25).r,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        home.getGreeting(),
                        style: buttonfond,
                      ),
                      SizedBox(
                        height: 10.r,
                      ),
                      Text(
                        log.user?.data?.user?.name ?? '',
                        style: drivernamefont,
                      ),
                      SizedBox(
                        height: 20.r,
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
