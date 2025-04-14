import 'package:binbookingapp/custom_widget/button.dart';
import 'package:binbookingapp/utils/appcolors.dart';
import 'package:binbookingapp/utils/style.dart';
import 'package:binbookingapp/view/dashboard_screens/my_orders/components/details_card.dart';
import 'package:binbookingapp/view/dashboard_screens/my_orders/components/form_card.dart';
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
      backgroundColor: CleanerAppcolors.primaryWhitecolor,
      bottomNavigationBar: BottomAppBar(
        color:  CleanerAppcolors.primaryWhitecolor,
        elevation: 0,
        height: 95.r,
        child:  CleanerButton.elevated(
              width: MediaQuery.sizeOf(context).width,
              backgroundcolor: CleanerAppcolors.primarybrowncolor,
              label: 'Update Order',
              onPressed: () {},
            ),
      ),
      appBar: AppBar(
        backgroundColor: CleanerAppcolors.primaryWhitecolor,
        scrolledUnderElevation: 0.r,
        title: Text('Pick Up Details', style: appbartitlefont)),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20).r,
        child: SingleChildScrollView(
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
           
            ],
          ),
        ),
      ),
    );
  }
}
