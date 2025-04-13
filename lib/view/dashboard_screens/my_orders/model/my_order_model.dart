class MyOrderModel {
  final String status;
  final String message;
  final RequestData data;

  MyOrderModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory MyOrderModel.fromJson(Map<String, dynamic> json) {
    return MyOrderModel(
      status: json['status'],
      message: json['message'],
      data: RequestData.fromJson(json['data']),
    );
  }
}

class RequestData {
  final List<RequestItem> siteRequests;
  final List<RequestItem> warehouseRequests;

  RequestData({
    required this.siteRequests,
    required this.warehouseRequests,
  });

  factory RequestData.fromJson(Map<String, dynamic> json) {
    return RequestData(
      siteRequests: (json['site_requests'] as List)
          .map((item) => RequestItem.fromJson(item))
          .toList(),
      warehouseRequests: (json['warehouse_requests'] as List)
          .map((item) => RequestItem.fromJson(item))
          .toList(),
    );
  }
}

class RequestItem {
  final int id;
  final int quantity;
  final String startDate;
  final String endDate;
  final String customerName;
  final String location;
  final int orderDuration;
  final String binSizeName;
  final String type;

  RequestItem({
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

  factory RequestItem.fromJson(Map<String, dynamic> json) {
    return RequestItem(
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
