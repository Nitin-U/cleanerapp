import 'package:cleanerapp/custom_widget/cleaner_textfield.dart';
import 'package:cleanerapp/custom_widget/custom_tile.dart';
import 'package:cleanerapp/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BinSearchBarView extends StatefulWidget {
  const BinSearchBarView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BinSearchBarViewState createState() => _BinSearchBarViewState();
}

class _BinSearchBarViewState extends State<BinSearchBarView> {
  List<String> items = [
    "Apple",
    "Banana",
    "Cherry",
    "Date",
    "Grapes",
    "Mango",
    "Orange",
    "Pineapple",
    "Strawberry",
    "Watermelon"
  ];

  List<String> filteredItems = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredItems = items;
  }

  void filterSearch(String query) {
    setState(() {
      filteredItems = items
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Search",
            style: appbartitlefont,
          )),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10).r,
        child: Column(
          children: [
            CleanerTextfield(
                onChanged: filterSearch,
                prefix: Icon(Icons.search_rounded),
                hintlabel: 'Search'),
            SizedBox(height: 10.r),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: List.generate(
                  filteredItems.length,
                  (index) => CustomListtile(title: filteredItems[index]),
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
