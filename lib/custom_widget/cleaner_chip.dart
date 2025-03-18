import 'package:cleanerapp/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CleanerChip extends StatelessWidget {
  final double? height;
  final double? width;
  final String label;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  const CleanerChip({
    super.key,
    required this.label,
    this.onPressed,
    this.backgroundColor,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: SizedBox(
        height: height,
        width: width,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: backgroundColor,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
            child: Text(
              label,
              style: dashboardlablefontwhite,
            ),
          ),
        ),
      ),
    );
  }
}
