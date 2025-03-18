import 'package:cleanerapp/custom_widget/cleaner_chip.dart';
import 'package:cleanerapp/utils/appcolors.dart';
import 'package:cleanerapp/utils/style.dart';
import 'package:cleanerapp/view/dashboard_screens/home/components/cleanerapp_bottom_sheet/cleanerapp_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyOrders extends StatelessWidget {
  const MyOrders({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyOrdersCard()
      ],
    );
  }
}

class MyOrdersCard extends StatelessWidget {
  const MyOrdersCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            border:
                Border.all(color: CleanerAppcolors.primaryminigreycolor)),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 22.h, horizontal: 10.w),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Lautinez Martinez',
                        style: listiletitlefont,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        'lautinazo@gmail.com',
                        style: splashloadingfond,
                      ),
                    ],
                  ),
                  CleanerChip(
                    onPressed: () {
                      showModalBottomSheet(
                        showDragHandle: true,
                        context: context,
                        builder: (context) {
                          return CleanerAppBottomSheet();
                        },
                      );
                    },
                    label: 'View',
                    backgroundColor: CleanerAppcolors.primarybrowncolor,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
