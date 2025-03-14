import 'package:cleanerapp/utils/style.dart';
import 'package:cleanerapp/view/dashboard_screens/home/home_provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../utils/appcolors.dart';

class OrdersTabs extends StatelessWidget {
  const OrdersTabs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, home, child) {
        return Row(
          spacing: 5,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  home.getTab(home.tabs = 0);
                },
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: home.tabs == 0
                                ? CleanerAppcolors.primaryGreencolor
                                : CleanerAppcolors.primarygreycolor),
                        color: home.tabs == 0
                            ? CleanerAppcolors.primaryGreencolor
                            : CleanerAppcolors.primarylightgreycolor,
                        borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Center(
                        child: Text(
                          'My Orders',
                          style: home.tabs == 0 ? resendwhitefont : resendfont,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  home.getTab(home.tabs = 1);
                },
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: home.tabs == 1
                                ? CleanerAppcolors.primaryGreencolor
                                : CleanerAppcolors.primarygreycolor),
                        color: home.tabs == 1
                            ? CleanerAppcolors.primaryGreencolor
                            : CleanerAppcolors.primarylightgreycolor,
                        borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Center(
                        child: Text(
                          'Upcoming Orders',
                          style: home.tabs == 1 ? resendwhitefont : resendfont,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
