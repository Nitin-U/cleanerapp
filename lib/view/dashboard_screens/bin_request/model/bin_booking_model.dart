class BinBookingModel {
  final String status;
  final String message;
  final BinRequestData data;

  BinBookingModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory BinBookingModel.fromJson(Map<String, dynamic> json) {
    return BinBookingModel(
      status: json['status'],
      message: json['message'],
      data: BinRequestData.fromJson(json['data']),
    );
  }
}

class BinRequestData {
  final List<RequestedItem> siteRequests;
  final List<RequestedItem> warehouseRequests;

  BinRequestData({
    required this.siteRequests,
    required this.warehouseRequests,
  });

  factory BinRequestData.fromJson(Map<String, dynamic> json) {
    return BinRequestData(
      siteRequests: (json['site_requests'] as List)
          .map((e) => RequestedItem.fromJson(e))
          .toList(),
      warehouseRequests: (json['warehouse_requests'] as List)
          .map((e) => RequestedItem.fromJson(e))
          .toList(),
    );
  }
}

class RequestedItem {
  final int id;
  final int quantity;
  final String startDate;
  final String endDate;
  final String customerName;
  final String location;
  final int orderDuration;
  final String binSizeName;
  final String type;

  RequestedItem({
    required this.id,
    required this.quantity,
    required this.startDate,
    required this.endDate,
    required this.customerName,
    required this.location,
    required this.orderDuration,
    required this.binSizeName,
    required this.type,
  });

  factory RequestedItem.fromJson(Map<String, dynamic> json) {
    return RequestedItem(
      id: json['Id'],
      quantity: json['quantity'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      customerName: json['customer_name'],
      location: json['location'],
      orderDuration: json['order_duration'],
      binSizeName: json['bin_size_name'],
      type: json['type'],
    );
  }
}
