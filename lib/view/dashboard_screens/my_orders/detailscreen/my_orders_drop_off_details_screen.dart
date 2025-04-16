import 'dart:io';

import 'package:binbookingapp/custom_widget/button.dart';
import 'package:binbookingapp/utils/appcolors.dart';
import 'package:binbookingapp/utils/style.dart';
import 'package:binbookingapp/view/dashboard_screens/my_orders/components/details_card.dart';
import 'package:binbookingapp/view/dashboard_screens/my_orders/my_orders_provider/my_order_provider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class MyOrdersDropOffDetailsScreen extends StatelessWidget {
  final int quantity;
  final String customerName;
  final String startdate;
  final String endate;
  final String location;
  final String duration;
  final String binsizename;
  const MyOrdersDropOffDetailsScreen({
    super.key,
    required this.quantity,
    required this.customerName,
    required this.startdate,
    required this.endate,
    required this.location,
    required this.duration,
    required this.binsizename,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MyOrderProvider>(
      builder: (context, order, child) {
        return Scaffold(
          backgroundColor: CleanerAppcolors.primaryWhitecolor,
          bottomNavigationBar: BottomAppBar(
            color: CleanerAppcolors.primaryWhitecolor,
            height: 90.r,
            elevation: 0,
            child: CleanerButton.elevated(
              backgroundcolor: CleanerAppcolors.primarybrowncolor,
              label: 'Update Order',
              onPressed: () {},
            ),
          ),
          appBar: AppBar(
            backgroundColor: CleanerAppcolors.primaryWhitecolor,
            scrolledUnderElevation: 0,
            title: Text('Drop Off Details', style: appbartitlefont),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15).r,
            child: SingleChildScrollView(
              child: Column(
                spacing: 15.r,
                children: [
                  DetailsCard(
                    customername: customerName,
                    duration: duration,
                    binsizename: binsizename,
                    quantity: quantity.toString(),
                    location: location,
                  ),
                  DropOffSelectImageCard(quantity: quantity),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class DropOffSelectImageCard extends StatelessWidget {
  final int quantity;

  const DropOffSelectImageCard({super.key, required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Consumer<MyOrderProvider>(
      builder: (context, order, child) {
        // ✅ Initialize image and damaged list if lengths don't match quantity
        if (order.imagesPerBin.length != quantity || order.isDamagedList.length != quantity) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            order.initializeDamagedList(quantity);
          });
        }

        return SizedBox(
          child: Column(
            spacing: 15.r,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(quantity, (index) {
              return SizedBox(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(
                      color: CleanerAppcolors.primaryminidarkgreycolor,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10).r,
                    child: Column(
                      children: [
                        Row(
                          spacing: 5.r,
                          children: [
                            Icon(Icons.list, size: 30.r),
                            Text('Bin Serial Number', style: ordercardheaderfont),
                          ],
                        ),
                        Divider(),
                        Row(
                          children: [
                            Text('Is Damaged', style: dashboardlabelfontblack),
                            Checkbox(
                              visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                              value: order.isDamagedList[index],
                              onChanged: (value) {
                                order.toggleCheckbox(index, value);
                              },
                            ),
                          ],
                        ),
                        order.imagesPerBin[index].isEmpty
                            ? GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Center(
                                          child: Text('Choose Image', style: resendfont),
                                        ),
                                        content: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                order.pickImage(index,context);
                                                Navigator.pop(context);
                                              },
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Icon(Icons.image),
                                                  Text('Gallery', style: dashboardlabelfontblack),
                                                ],
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                order.captureImage(index);
                                                Navigator.pop(context);
                                              },
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Icon(Icons.camera),
                                                  Text('Camera', style: dashboardlabelfontblack),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: SizedBox(
                                  width: MediaQuery.sizeOf(context).width,
                                  child: DottedBorder(
                                    color: CleanerAppcolors.primaryminidarkgreycolor,
                                    dashPattern: [3, 3],
                                    borderType: BorderType.RRect,
                                    radius: Radius.circular(10.r),
                                    child: Center(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(vertical: 20.r),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(Icons.image_outlined, size: 30.r, color: CleanerAppcolors.primarybrowncolor),
                                            SizedBox(height: 8.r),
                                            Text('Choose an image or take a picture', style: dashboardlablefontbrown),
                                            Text('Only 3 images allowed', style: dashboardlablefontgrey),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : SizedBox(
                                width: MediaQuery.sizeOf(context).width,
                                child: DottedBorder(
                                  color: CleanerAppcolors.primaryminidarkgreycolor,
                                  dashPattern: [3, 3],
                                  borderType: BorderType.RRect,
                                  radius: Radius.circular(10.r),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.r),
                                    child: Wrap(
                                      alignment: WrapAlignment.center,
                                      spacing: 10.r,
                                      runSpacing: 10.r,
                                      children: List.generate(order.imagesPerBin[index].length, (imgIndex) {
                                        var image = order.imagesPerBin[index][imgIndex];
                                        return SelectedImageCard(
                                          imagepath: image,
                                          onTap: () {
                                            order.removeImage(index, imgIndex);
                                          },
                                        );
                                      }),
                                    ),
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        );
      },
    );
  }
}


class SelectedImageCard extends StatelessWidget {
  final VoidCallback? onTap;
  final XFile imagepath;
  const SelectedImageCard({super.key, required this.imagepath, this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.r,
      width: 100.r,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Card or container
          SizedBox(
            height: 80.r,
            width: 100.r,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Image.file(File(imagepath.path)),
            ),
          ),
          // Remove Icon in top-right corner
          Positioned(
            top: -10.r,
            right: -10.r, // changed from left to right
            child: GestureDetector(
              onTap: onTap,
              child: Icon(Icons.remove_circle, color: Colors.red, size: 40.r),
            ),
          ),
        ],
      ),
    );
  }
}
