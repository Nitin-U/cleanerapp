import 'package:cleanerapp/custom_widget/cleaner_textfield.dart';
import 'package:cleanerapp/custom_widget/transaction_route.dart';
import 'package:cleanerapp/utils/appcolors.dart';
import 'package:cleanerapp/utils/style.dart';
import 'package:cleanerapp/view/authentication/login/login_provider/login_provider.dart';
import 'package:cleanerapp/view/dashboard_screens/bin_request/bin_request_provider/bin_request_provider.dart';
import 'package:cleanerapp/view/dashboard_screens/home/bin_search_bar/bin_search_bar_view.dart';
import 'package:cleanerapp/view/dashboard_screens/home/components/cleaner_app_drawer/cleaner_app_drawer.dart';
import 'package:cleanerapp/view/dashboard_screens/home/components/greetings_card.dart';
import 'package:cleanerapp/view/dashboard_screens/home/components/drop_off/drop_off_list.dart';
import 'package:cleanerapp/view/dashboard_screens/home/components/orders_tabs/orders_tabs.dart';
import 'package:cleanerapp/view/dashboard_screens/home/components/pick_up/pick_up_list.dart';
import 'package:cleanerapp/view/dashboard_screens/home/home_provider/home_provider.dart';
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
            elevation: 0,
            actions: [
              Builder(
                builder: (context) => GestureDetector(
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                    child: CircleAvatar(
                        backgroundColor: CleanerAppcolors.primarygreycolor,
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
              CircleAvatar(
                  backgroundColor: CleanerAppcolors.primarygreycolor,
                  radius: 20.r,
                  child: CircleAvatar(
                    radius: 18.r,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.notifications_none,
                      size: 22.r,
                      color: CleanerAppcolors.primarygreycolor,
                    ),
                  )),
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
                  OrdersTabs(),
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
