
import 'package:binbookingapp/view/dashboard_screens/bin_request/model/bin_booking_model.dart';
import 'package:binbookingapp/view/dashboard_screens/bin_request/service/bin_booking_api_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BinRequestProvider extends ChangeNotifier {
  int currenttab = 0;
  bool loadingbinbooking = true;
  bool loadingrequestaccept = true;
  TextEditingController driveridcontroller = TextEditingController();
  TextEditingController bookingidcontroller = TextEditingController();
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

 Future<void> getRequestAccept(context,driverid,binbookingid,token) async {
    try {
      loadingrequestaccept = true;
      notifyListeners();

      final accept = await fetchRequestAccept(
        driverid,binbookingid,token
      );
      if (accept['status'] == 'success') {
        
       Fluttertoast.showToast(
        gravity: ToastGravity.TOP,
        msg: accept['message']);
        print(accept);
      
      } else {
       Fluttertoast.showToast(
        gravity: ToastGravity.CENTER,
        msg: accept['message']);
        print(accept);
      }

      loadingrequestaccept = false;
      notifyListeners();
    } catch (e) {
      loadingrequestaccept = false;
      notifyListeners();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$e')));
      print('Error: $e'); // Log the error for debugging
      throw {"error": e};
    }
  }


List<RequestedItem> allRequests = [];
List<RequestedItem> filteredRequests = [];

void setRequests(List<RequestedItem> siteRequests, List<RequestedItem> warehouseRequests) {
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
