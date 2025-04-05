import 'package:cleanerapp/view/dashboard_screens/bin_request/model/bin_booking_model.dart';
import 'package:cleanerapp/view/dashboard_screens/bin_request/service/bin_booking_api_service.dart';
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

      // Await the token retrieval
      // final token = await Utils.getToken();
      // if (token == null || token.isEmpty) {
      //   throw Exception("Token is not available.");
      // }

      // Fetch wallet data
      final binbook = await fetchBinbooking(token);
      _binBookingModel = BinBookingModel.fromJson(binbook);
      print('binbooking $binbook');

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

  List<String> binRequestData = [
    'Summers',
    'Summers',
    'Summers',
    'Summers',
    'Summers',
    'Summers',
    'Summers',
    'Summers',
    'Summers',
    'Summers',
    'Summers',
    'Summers',
    'Summers',
    'Summers',
  ];
}
