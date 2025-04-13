import 'package:binbookingapp/custom_widget/button.dart';

import 'package:binbookingapp/utils/appcolors.dart';
import 'package:binbookingapp/utils/cleanericonspng.dart';
import 'package:binbookingapp/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyOrdersPickupDetailsScreen extends StatelessWidget {
  final String customername;
  final String startDate;
  final String endate;
  final int quantity;
  final String binsizename;
  final String duration;
  final String location;

  const MyOrdersPickupDetailsScreen({
    super.key,
    required this.customername,
    required this.startDate,
    required this.endate,
    required this.quantity,
    required this.binsizename,
    required this.duration,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pick Up Details', style: appbartitlefont)),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 15.r,
          children: [
            DetailsCard(
              customername: customername,
              duration: duration,
              binsizename: binsizename,
              quantity: quantity.toString(),
              location: location,
            ),
            FormCard(quantity: quantity),
            Spacer(),
            CleanerButton.elevated(
              width: MediaQuery.sizeOf(context).width,
              backgroundcolor: CleanerAppcolors.primarybrowncolor,
              label: 'Update Order',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class FormCard extends StatelessWidget {
  const FormCard({super.key, required this.quantity});

  final int quantity;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: CleanerAppcolors.primaryminigreycolor),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15).r,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                spacing: 5.r,
                children: [
                  Icon(Icons.file_copy_outlined, size: 20.r),
                  Text('Fill the form', style: ordercardheaderfont),
                ],
              ),
              Divider(
                color: CleanerAppcolors.primaryminigreycolor,
              ),
              SizedBox(height: 10.r),
              Column(
                children: List.generate(
                  quantity,
                  (index) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Serial Number ${index + 1}',
                        style: splashloadingfond,
                      ),
                      TextFormField(
                        style: entertexttile,
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 10).r,
                          hintText: 'Enter serial number',
                          hintStyle: hintStyle,

                          // 🔽 Default border when not focused
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color:
                                  CleanerAppcolors
                                      .primaryminigreycolor, // change this to your color
                              width: 1.5.r, // change thickness here
                            ),
                          ),

                          // 🔽 Border when focused (on tap)
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color:
                                  CleanerAppcolors
                                      .primarybrowncolor, // focused color
                              width: 1.5.r, // focused thickness
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.r,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailsCard extends StatelessWidget {
  final String customername;
  final String duration;
  final String binsizename;
  final String quantity;
  final String location;
  const DetailsCard({
    super.key,
    required this.customername,
    required this.duration,
    required this.binsizename,
    required this.quantity,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10).r,
          border: Border.all(color: CleanerAppcolors.primaryminigreycolor),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15).r,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                spacing: 5.r,
                children: [
                  Image.asset(AppIcons.myordersicon, height: 20.r),
                  Text('Orders Details', style: ordercardheaderfont),
                ],
              ),
              Divider(
                color: CleanerAppcolors.primaryminigreycolor,
              ),
              SizedBox(height: 10.r),
              DetailsLabel(label: 'Customer Name', sublabel: customername),
              SizedBox(height: 5.r),
              DetailsLabel(label: 'Duration', sublabel: duration),
              SizedBox(height: 5.r),
              DetailsLabel(label: 'Bin Size Name', sublabel: binsizename),
              SizedBox(height: 5.r),
              DetailsLabel(label: 'Quantity', sublabel: quantity),
              SizedBox(height: 5.r),

              DetailsLabel(label: 'Location', sublabel: location),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailsLabel extends StatelessWidget {
  final String label;
  final String sublabel;
  const DetailsLabel({super.key, required this.label, required this.sublabel});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: subtitlefonts),
        Text(sublabel, style: resendfontminigrey),
      ],
    );
  }
}
