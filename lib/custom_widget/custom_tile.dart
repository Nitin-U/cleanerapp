import 'package:binbookingapp/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomListtile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onTap;
  const CustomListtile({
    super.key,
    required this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      minLeadingWidth: -12.r,
      leading: leading,
      trailing: trailing,
      contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0).r,
      dense: true,
      visualDensity: VisualDensity(vertical: -4, horizontal: -4),
      title: Text(
        title,
        style: listiletitlefont,
      ),
      subtitle: subtitle == null
          ? null
          : Text(
              subtitle!,
              style: dashboardlablefontgrey,
            ),
    );
  }
}
