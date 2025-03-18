import 'package:cleanerapp/utils/appcolors.dart';
import 'package:cleanerapp/utils/style.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: CleanerAppcolors.primarylightgreycolor,
        title: Text(
          'Profile',
          style: appbartitlefont,
        ),
      ),
      backgroundColor: CleanerAppcolors.primarylightgreycolor,
      body: Column(
        children: [
          SizedBox(
            child: DecoratedBox(
              decoration: BoxDecoration(),
              child: Row(
                children: [
                  CircleAvatar(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Aakash Sunar',
                        style: listiletitlefont,
                      ),
                      Text(
                        'aakashsharma73235@gmail.com',
                        style: dashboardlablefontgrey,
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
