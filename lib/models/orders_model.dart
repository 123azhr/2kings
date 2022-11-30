import 'package:flutter/cupertino.dart';

class OrdersModel with ChangeNotifier {
  final String? orderID;
  final String? contractorID;
  final String? customerBalance;
  final String? status;
  final List? logs;
  final DateTime? endDate;
  final DateTime? startDate;
  final String? customerID;
  final String? details;

  OrdersModel({
    this.orderID,
    this.contractorID,
    this.customerBalance,
    this.status,
    this.logs,
    this.endDate,
    this.startDate,
    this.customerID,
    this.details,
  });
  factory OrdersModel.fromMap(
      {required Map<String, dynamic> map, required String orderID}) {
    return OrdersModel(
      orderID: orderID,
      contractorID: map["contractorID"],
      customerID: map["customerID"],
      customerBalance: map["customerBalance"],
      details: map["details"],
      endDate: map["endDate"],
      logs: map["logs"],
      startDate: map["startDate"],
      status: map["status"],
    );
  }
}
