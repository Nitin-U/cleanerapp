class MyOrdersDropOffDetailModel {
  String? status;
  String? message;
  Data? data;
  List<BookingSerialNumbers>? bookingSerialNumbers;

  MyOrdersDropOffDetailModel(
      {this.status, this.message, this.data, this.bookingSerialNumbers});

  MyOrdersDropOffDetailModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    if (json['booking_serial_numbers'] != null) {
      bookingSerialNumbers = <BookingSerialNumbers>[];
      json['booking_serial_numbers'].forEach((v) {
        bookingSerialNumbers!.add(BookingSerialNumbers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (bookingSerialNumbers != null) {
      data['booking_serial_numbers'] =
          bookingSerialNumbers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  int? quantity;
  String? startDate;
  String? endDate;
  String? customerName;
  String? location;
  int? orderDuration;
  String? binSizeName;
  String? type;
  String? stage;
  String? status;

  Data(
      {this.id,
      this.quantity,
      this.startDate,
      this.endDate,
      this.customerName,
      this.location,
      this.orderDuration,
      this.binSizeName,
      this.type,
      this.stage,
      this.status});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    quantity = json['quantity'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    customerName = json['customer_name'];
    location = json['location'];
    orderDuration = json['order_duration'];
    binSizeName = json['bin_size_name'];
    type = json['type'];
    stage = json['stage'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['quantity'] = quantity;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['customer_name'] = customerName;
    data['location'] = location;
    data['order_duration'] = orderDuration;
    data['bin_size_name'] = binSizeName;
    data['type'] = type;
    data['stage'] = stage;
    data['status'] = status;
    return data;
  }
}

class BookingSerialNumbers {
  int? id;
  String? serialNumber;

  BookingSerialNumbers({this.id, this.serialNumber});

  BookingSerialNumbers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    serialNumber = json['serial_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['serial_number'] = serialNumber;
    return data;
  }
}