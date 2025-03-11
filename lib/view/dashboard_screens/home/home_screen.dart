import 'package:cleanerapp/custom_widget/cleaner_chip.dart';
import 'package:cleanerapp/custom_widget/cleaner_textfield.dart';
import 'package:cleanerapp/utils/style.dart';
import 'package:cleanerapp/view/dashboard_screens/home/components/greetings_card.dart';
import 'package:cleanerapp/view/dashboard_screens/home/home_provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, home, child) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                Row(
                  spacing: 5,
                  children: [
                    Expanded(
                        child: CleanerTextfield(
                            suffix: Icon(Icons.search), hintlabel: 'Search')),
                    Icon(Icons.filter)
                  ],
                ),
                GreetingsCard(),
                Text(
                  'Active Orders',
                  style: greetingsStyleblack,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CleanerChip(
                        backgroundColor: Colors.red,
                        onPressed: () {},
                        label: 'My Orders'),
                    CleanerChip(
                        backgroundColor: Colors.grey,
                        onPressed: () {},
                        label: 'UpComing Orders')
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
