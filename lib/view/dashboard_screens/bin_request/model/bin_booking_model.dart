class BinBookingModel {
  List<BinBookings>? binBookings;

  BinBookingModel({this.binBookings});

  BinBookingModel.fromJson(Map<String, dynamic> json) {
    if (json['bin_bookings'] != null) {
      binBookings = <BinBookings>[];
      json['bin_bookings'].forEach((v) {
        binBookings!.add(BinBookings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (binBookings != null) {
      data['bin_bookings'] = binBookings!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BinBookings {
  int? id;
  int? binSizeId;
  int? binId;
  int? quantity;
  String? startDate;
  String? endDate;
  String? status;
  String? stage;
  int? warehouseDroppedBy;
  int? onsiteDeliveryBy;
  String? customerName;
  String? customerContact;
  String? customerEmail;
  String? customerAddress;
  String? customerLotNumber;
  String? paymentOption;
  String? amountPaid;
  String? pendingAmount;
  String? type;
  int? createdBy;
  String? updatedBy;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;
  Bin? bin;

  BinBookings(
      {this.id,
      this.binSizeId,
      this.binId,
      this.quantity,
      this.startDate,
      this.endDate,
      this.status,
      this.stage,
      this.warehouseDroppedBy,
      this.onsiteDeliveryBy,
      this.customerName,
      this.customerContact,
      this.customerEmail,
      this.customerAddress,
      this.customerLotNumber,
      this.paymentOption,
      this.amountPaid,
      this.pendingAmount,
      this.type,
      this.createdBy,
      this.updatedBy,
      this.deletedAt,
      this.createdAt,
      this.updatedAt,
      this.bin});

  BinBookings.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    binSizeId = json['bin_size_id'];
    binId = json['bin_id'];
    quantity = json['quantity'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    status = json['status'];
    stage = json['stage'];
    warehouseDroppedBy = json['warehouse_dropped_by'];
    onsiteDeliveryBy = json['onsite_delivery_by'];
    customerName = json['customer_name'];
    customerContact = json['customer_contact'];
    customerEmail = json['customer_email'];
    customerAddress = json['customer_address'];
    customerLotNumber = json['customer_lot_number'];
    paymentOption = json['payment_option'];
    amountPaid = json['amount_paid'];
    pendingAmount = json['pending_amount'];
    type = json['type'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    bin = json['bin'] != null ? Bin.fromJson(json['bin']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['bin_size_id'] = binSizeId;
    data['bin_id'] = binId;
    data['quantity'] = quantity;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['status'] = status;
    data['stage'] = stage;
    data['warehouse_dropped_by'] = warehouseDroppedBy;
    data['onsite_delivery_by'] = onsiteDeliveryBy;
    data['customer_name'] = customerName;
    data['customer_contact'] = customerContact;
    data['customer_email'] = customerEmail;
    data['customer_address'] = customerAddress;
    data['customer_lot_number'] = customerLotNumber;
    data['payment_option'] = paymentOption;
    data['amount_paid'] = amountPaid;
    data['pending_amount'] = pendingAmount;
    data['type'] = type;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['deleted_at'] = deletedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (bin != null) {
      data['bin'] = bin!.toJson();
    }
    return data;
  }
}

class Bin {
  int? id;
  int? binSizeId;
  int? initialStock;
  int? available;
  int? draft;
  int? inProgress;
  int? damaged;
  int? status;
  int? createdBy;
  String? updatedBy;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;

  Bin(
      {this.id,
      this.binSizeId,
      this.initialStock,
      this.available,
      this.draft,
      this.inProgress,
      this.damaged,
      this.status,
      this.createdBy,
      this.updatedBy,
      this.deletedAt,
      this.createdAt,
      this.updatedAt});

  Bin.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    binSizeId = json['bin_size_id'];
    initialStock = json['initial_stock'];
    available = json['available'];
    draft = json['draft'];
    inProgress = json['in_progress'];
    damaged = json['damaged'];
    status = json['status'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['bin_size_id'] = binSizeId;
    data['initial_stock'] = initialStock;
    data['available'] = available;
    data['draft'] = draft;
    data['in_progress'] = inProgress;
    data['damaged'] = damaged;
    data['status'] = status;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['deleted_at'] = deletedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
