
import 'package:binbookingapp/custom_widget/cleaner_textfield.dart';
import 'package:binbookingapp/custom_widget/transaction_route.dart';
import 'package:binbookingapp/utils/appcolors.dart';
import 'package:binbookingapp/utils/style.dart';
import 'package:binbookingapp/view/dashboard_screens/home/bin_search_bar/bin_search_bar_view.dart';
import 'package:binbookingapp/view/dashboard_screens/home/components/cleaner_app_drawer/cleaner_app_drawer.dart';
import 'package:binbookingapp/view/dashboard_screens/home/components/drop_off/drop_off_list.dart';
import 'package:binbookingapp/view/dashboard_screens/home/components/greetings_card.dart';
import 'package:binbookingapp/view/dashboard_screens/home/components/home_tabs/home_tabs.dart';
import 'package:binbookingapp/view/dashboard_screens/home/components/pick_up/pick_up_list.dart';
import 'package:binbookingapp/view/dashboard_screens/home/home_provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, home, child) {
        return Scaffold(
          drawer: CleanerAppDrawer(),
          appBar: AppBar(
            scrolledUnderElevation: 0,
            actions: [
              Builder(
                builder: (context) => GestureDetector(
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                    child: CircleAvatar(
                        backgroundColor: CleanerAppcolors.primaryminidarkgreycolor,
                        radius: 20.r,
                        child: CircleAvatar(
                          radius: 18.r,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.menu,
                            size: 22.r,
                            color: CleanerAppcolors.primarygreycolor,
                          ),
                        ))),
              ),
              SizedBox(
                width: 12.r,
              ),
              
              
            ],
            backgroundColor: CleanerAppcolors.primaryminigreycolor,
            automaticallyImplyLeading: false,
          ),
          backgroundColor: CleanerAppcolors.primaryminigreycolor,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10).r,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 15.r,
                children: [
                  CleanerTextfield(
                      fillColor: CleanerAppcolors.primaryWhitecolor,
                      onTap: () {
                        Navigator.push(context,
                            CustomPageRoute(child: BinSearchBarView()));
                      },
                      prefix: Icon(Icons.search),
                      hintlabel: 'Search'),
                  GreetingsCard(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Active Orders',
                        style: greetingsStyleblack,
                      ),
                      Icon(
                        Icons.keyboard_arrow_right_outlined,
                        size: 20.r,
                      )
                    ],
                  ),
                  HomeTabs(),
                  if (home.tabs == 0) PickUp(),
                  if (home.tabs == 1) DropOff(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
