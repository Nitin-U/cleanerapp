import 'package:cleanerapp/utils/style.dart';
import 'package:flutter/material.dart';

class CustomListtile extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onTap;
  const CustomListtile({
    super.key,
    required this.title,
    required this.subtitle,
    this.leading,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      minLeadingWidth: 0,
      leading: leading,
      trailing: trailing,
      contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
      dense: true,
      visualDensity: VisualDensity(
        vertical: -4,
      ),
      title: Text(
        title,
        style: listiletitlefont,
      ),
      subtitle: Text(
        subtitle,
        style: dashboardlablefontgrey,
      ),
    );
  }
}
