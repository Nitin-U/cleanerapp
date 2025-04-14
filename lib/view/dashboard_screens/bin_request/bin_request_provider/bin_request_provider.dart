
import 'package:binbookingapp/view/dashboard_screens/bin_request/model/bin_booking_model.dart';
import 'package:binbookingapp/view/dashboard_screens/bin_request/service/bin_booking_api_service.dart';
import 'package:flutter/material.dart';

class BinRequestProvider extends ChangeNotifier {
  int currenttab = 0;
  bool loadingbinbooking = true;
  BinBookingModel? _binBookingModel;
  BinBookingModel? get binbook => _binBookingModel;

  Future<void> getBinRequestData(token) async {
    try {
      loadingbinbooking = true;
      notifyListeners();
      final binbook = await fetchBinbooking(token);
      _binBookingModel = BinBookingModel.fromJson(binbook);
     

      loadingbinbooking = false;
      notifyListeners();
    } catch (e) {
      loadingbinbooking = false;
      notifyListeners();
      print('Error in getWalletData: $e');
      rethrow;
    }
  }

  void toggleTab(int index) {
    currenttab = index;
    notifyListeners();
  }


   List<RequestItem> allRequests = [];
  List<RequestItem> filteredRequests = [];

  void setRequests(List<RequestItem> siteRequests, List<RequestItem> warehouseRequests) {
    allRequests = [...siteRequests, ...warehouseRequests];
    filteredRequests = allRequests;
    notifyListeners();
  }

  void filter(String query) {
    query = query.toLowerCase();
    filteredRequests = allRequests.where((item) {
      return item.customerName.toLowerCase().contains(query) ||
          item.location.toLowerCase().contains(query) ||
          item.startDate.toLowerCase().contains(query) ||
          item.endDate.toLowerCase().contains(query) ||
          item.binSizeName.toLowerCase().contains(query) ||
          item.type.toLowerCase().contains(query);
    }).toList();
    notifyListeners();
  }
}
