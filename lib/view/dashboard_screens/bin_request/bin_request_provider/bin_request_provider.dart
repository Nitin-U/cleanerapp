
import 'package:binbookingapp/utils/style.dart';
import 'package:binbookingapp/view/dashboard_screens/bin_request/model/bin_booking_model.dart';
import 'package:binbookingapp/view/dashboard_screens/bin_request/service/bin_booking_api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

Future<void> getRequestAccept(
  BuildContext context,
  String token,
  String bookingid,
  String driverid,
) async {
  print('${bookingid}${driverid}');
  try {
    loadingrequestaccept = true;
    notifyListeners();

    final accept = await fetchRequestAccept(token, bookingid, driverid);

    loadingrequestaccept = false;
    notifyListeners();

    print('accept: $accept');

    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.only(
            bottom: MediaQuery.sizeOf(context).height -170.r,
            left: 10.r,
            right: 10.r
          ),
          dismissDirection: DismissDirection.up,
          content: Text(
            accept['message'] ?? 'Unknown response',
            style: dashboardlablefontwhite,
          ),
          backgroundColor: accept['status'] == 'success' ? Colors.black : Colors.black,
        ),
      );
    }
  } catch (e) {
    loadingrequestaccept = false;
    notifyListeners();

    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }

    print('Error: $e');
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
