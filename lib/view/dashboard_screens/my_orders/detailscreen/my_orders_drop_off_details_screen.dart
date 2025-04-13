import 'dart:io';

import 'package:binbookingapp/custom_widget/button.dart';
import 'package:binbookingapp/utils/appcolors.dart';
import 'package:binbookingapp/utils/style.dart';
import 'package:binbookingapp/view/dashboard_screens/my_orders/components/details_card.dart';
import 'package:binbookingapp/view/dashboard_screens/my_orders/my_orders_provider/my_order_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class MyOrdersDropOffDetailsScreen extends StatelessWidget {
  final int quantity;
  final String customerName;
  final String startdate;
  final String endate;
  final String location;
  final String duration;
  final String binsizename;
  const MyOrdersDropOffDetailsScreen({super.key, required this.quantity, required this.customerName, required this.startdate, required this.endate, required this.location, required this.duration, required this.binsizename});

  @override
  Widget build(BuildContext context) {
    return Consumer<MyOrderProvider>(builder: (context, order, child) {
      return  Scaffold(
      appBar: AppBar(
        title: Text('Drop Off Details',style: appbartitlefont,),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(vertical: 10,horizontal: 20).r,
        child: Column(
          children: [
            DetailsCard(customername: customerName, duration:duration , binsizename:binsizename , quantity: quantity.toString(), location: location),
           SizedBox(
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10).r,
                border: Border.all()
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('Is Damaged'),
                      Checkbox(value: order.isdamaged, onChanged: (value) {
                        order.toggleisdamaged();
                      },)
                    ],
                  ),
                  CleanerButton.elevated(
                    backgroundcolor: CleanerAppcolors.primarybrowncolor,
                    width: MediaQuery.sizeOf(context).width,
                    label: 'Pick Image', onPressed: () {
                    showDialog(context: context, builder: (context) {
                      return AlertDialog(
                        title: Center(child: Text('Choose Image',style: resendfont,)),
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                order.pickImage(context);
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.image),
                                  Text('Gallery',style: dashboardlabelfontblack,)
                                ],
                              ),
                            ), GestureDetector(
                              onTap: () {
                                order.captureImage(context);
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.camera),
                                  Text('Camera',style: dashboardlabelfontblack,)
                                ],
                              ),
                            ),
                          ],
                        ),

                        
                      );
                    },);
                  },),
                 Wrap(
          spacing: 10.r,
          children: order.images.map((image) {
            return Image.file(
              File(image.path),
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            );
          }).toList(),
        ),

                ],
              ),
            ),
           )
          ],
        ),
      ),
    );
    },);
  }
}