import 'package:cleanerapp/custom_widget/cleaner_chip.dart';
import 'package:cleanerapp/utils/appcolors.dart';
import 'package:cleanerapp/utils/style.dart';
import 'package:cleanerapp/view/dashboard_screens/home/components/cleanerapp_bottom_sheet/cleanerapp_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyOrdersCard extends StatelessWidget {
  final String name;
  final String address;
  final String quantity;
  final String email;
  final String startdate;
  final String enddate;
  final String contact;
  const MyOrdersCard({
    super.key,
    required this.name,
    required this.address,
    required this.quantity,
    required this.startdate,
    required this.enddate,
    required this.contact, required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(color: CleanerAppcolors.primaryminigreycolor)),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 22, horizontal: 15).r,
          child: Column(
            spacing: 10.r,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name,
                    style: listiletitlefont,
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
              ),
              Text(
                email,
                style: splashloadingfond,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    startdate,
                    style: splashloadingfond,
                  ),
                  Text(
                    enddate,
                    style: splashloadingfond,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    quantity,
                    style: splashloadingfond,
                  ),
                  Text(
                    contact,
                    style: splashloadingfond,
                  ),
                ],
              ),
              Text(address,style: splashloadingfond,)
            ],
          ),
        ),
      ),
    );
  }
}
