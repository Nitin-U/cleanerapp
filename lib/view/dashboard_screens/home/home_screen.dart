import 'package:cleanerapp/utils/style.dart';
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
          appBar: AppBar(),
          body: Column(
            children: [
              SizedBox(
                width: MediaQuery.sizeOf(context).width,
                child: DecoratedBox(
                  decoration: BoxDecoration(),
                  child: Column(
                    children: [
                      Text(
                        '${home.getGreeting()}Aakash',
                        style: greetingsStyle,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
