import 'package:cleanerapp/custom_widget/cleaner_chip.dart';
import 'package:cleanerapp/utils/appcolors.dart';
import 'package:cleanerapp/utils/style.dart';
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
  final VoidCallback? onTap;
  final VoidCallback? onPressed;
  const MyOrdersCard({
    super.key,
    required this.name,
    required this.address,
    required this.quantity,
    required this.startdate,
    required this.enddate,
    this.onPressed,
    this.onTap,
    required this.contact,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 3.r,
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 22, horizontal: 15).r,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.pin_drop_outlined,
                            size: 20.r,
                            color: CleanerAppcolors.primarylightbrowncolor,
                          ),
                          Text(
                            name,
                            style: listiletitlefont,
                          ),
                        ],
                      ),
                      CleanerChip(
                        onPressed: onPressed,
                        label: 'View',
                        backgroundColor:
                            CleanerAppcolors.primarylightgreencolor,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        address,
                        style: listiletitlefont,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5.r,
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r)),
                    color: CleanerAppcolors.primaryminigreycolor,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10).r,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Start Date',
                                style: greetingsStyleblack,
                              ),
                              Text(
                                startdate,
                                style: dashboardlabelfontdarkgrey,
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                'Quantity',
                                style: greetingsStyleblack,
                              ),
                              Text(
                                quantity,
                                style: dashboardlabelfontdarkgrey,
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'End date',
                                style: greetingsStyleblack,
                              ),
                              Text(
                                enddate,
                                style: dashboardlabelfontdarkgrey,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
//  Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     startdate,
//                     style: splashloadingfond,
//                   ),
//                   Text(
//                     enddate,
//                     style: splashloadingfond,
//                   ),
//                 ],
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     quantity,
//                     style: splashloadingfond,
//                   ),
//                   Text(
//                     contact,
//                     style: splashloadingfond,
//                   ),
//                 ],
//               ),
