
import 'package:binbookingapp/custom_widget/button.dart';
import 'package:binbookingapp/custom_widget/custom_tile.dart';
import 'package:binbookingapp/utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BinBookingBottomSheet extends StatelessWidget {
  final String customername;
  final String location;
  final String endDate;
  final String type;
  final String binsizeName;
  const BinBookingBottomSheet({
    super.key,
    required this.customername,
    required this.location,
    required this.endDate,
    required this.type,
    required this.binsizeName,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10).r,
        child: SingleChildScrollView(
          child: Column(
            spacing: 10.r,
            children: [
              CustomListtile(
                subtitle: customername,
                title: 'Customer Name',
                trailing: Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 20.r,
                ),
              ),
              CustomListtile(
                subtitle: location,
                title: 'Location',
                trailing: Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 20.r,
                ),
              ),
              CustomListtile(
                subtitle: endDate,
                title: 'End Date',
                trailing: Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 20.r,
                ),
              ),
              CustomListtile(
                subtitle: endDate,
                title: 'Type',
                trailing: Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 20.r,
                ),
              ),
              CustomListtile(
                subtitle: 'Bin Size:$binsizeName',
                title: 'Bin Size Name',
                trailing: Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 20.r,
                ),
              ),
              CleanerButton.elevated(
                  width: MediaQuery.sizeOf(context).width,
                  backgroundcolor: CleanerAppcolors.primarybrowncolor,
                  label: 'Accept',
                  onPressed: () {})
            ],
          ),
        ),
      ),
    );
  }
}
