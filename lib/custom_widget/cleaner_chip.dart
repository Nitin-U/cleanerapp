import 'package:cleanerapp/utils/style.dart';
import 'package:flutter/material.dart';

class CleanerChip extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  const CleanerChip({
    super.key,
    required this.label,
    this.onPressed,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      labelStyle: dashboardlablefontwhite,
      disabledColor: backgroundColor,
      onPressed: onPressed,
      backgroundColor:backgroundColor,
      side: BorderSide(color: Colors.grey), // Fix applied here
      label: Text(
        label,
        // Ensure this is properly defined
      ),
    );
  }
}
