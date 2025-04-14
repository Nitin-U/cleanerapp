import 'package:binbookingapp/view/dashboard_screens/bin_request/bin_request_provider/bin_request_provider.dart';
import 'package:binbookingapp/view/dashboard_screens/bin_request/model/bin_booking_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BinSearchScreen extends StatelessWidget {
  final BinBookingModel model;

  const BinSearchScreen({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BinRequestProvider()..setRequests(
        model.data.siteRequests, model.data.warehouseRequests),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Search Requests"),
        ),
        body: Consumer<BinRequestProvider>(
          builder: (context, provider, _) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    onChanged: provider.filter,
                    decoration: InputDecoration(
                      hintText: 'Search by name, location, date, etc.',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: provider.filteredRequests.length,
                    itemBuilder: (context, index) {
                      final item = provider.filteredRequests[index];
                      return Card(
                        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        child: ListTile(
                          title: Text(item.customerName),
                          subtitle: Text("${item.location} • ${item.startDate} → ${item.endDate}"),
                          trailing: Text(item.binSizeName),
                        ),
                      );
                    },
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
