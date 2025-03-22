import 'package:cleanerapp/custom_widget/cleaner_chip.dart';
import 'package:cleanerapp/custom_widget/custom_tile.dart';
import 'package:cleanerapp/utils/appcolors.dart';
import 'package:flutter/material.dart';

class BinRequests extends StatelessWidget {
  const BinRequests({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomListtile(
            trailing: CleanerChip(
              label: 'View',
              backgroundColor: CleanerAppcolors.primarybrowncolor,
            ),
            title: 'Bin Requests')
      ],
    );
  }
}
