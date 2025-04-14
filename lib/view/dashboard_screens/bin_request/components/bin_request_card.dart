
import 'package:binbookingapp/custom_widget/cleaner_chip.dart' show CleanerChip;
import 'package:binbookingapp/utils/appcolors.dart';
import 'package:binbookingapp/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BinRequestCard extends StatelessWidget {
  final String address;
  final String binsizename;
  final String quantity;
  final String startdate;
  final String duration;
  final VoidCallback? onTap;
  final VoidCallback? onPressed;
  const BinRequestCard({
    super.key,
    required this.address,
    required this.quantity,
    required this.startdate,
    required this.binsizename,
    required this.duration,
    this.onPressed,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 2.r,
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
                            address,
                            style: listiletitlefont,
                          ),
                        ],
                      ),
                      CleanerChip(
                        onPressed: onPressed,
                        label: 'View',
                        backgroundColor:
                            CleanerAppcolors.primarybrowncolor,
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 19).r,
                    child: Text(
                      'Bin Size:$binsizename',
                      style: listiletitlefont,
                    ),
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
                          EdgeInsets.symmetric(horizontal: 15, vertical: 15).r,
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
                            children: [
                              Text(
                                'Duration',
                                style: greetingsStyleblack,
                              ),
                              Text(
                                duration,
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
