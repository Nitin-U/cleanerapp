import 'package:flutter/material.dart';

class MyOrdersDropOffDetailsScreen extends StatelessWidget {
  final int quantity;
  final String customerName;
  final String startdate;
  final String endate;
  final String location;
  const MyOrdersDropOffDetailsScreen({super.key, required this.quantity, required this.customerName, required this.startdate, required this.endate, required this.location});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          
        ],
      ),
    );
  }
}