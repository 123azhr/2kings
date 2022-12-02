import 'package:flutter/material.dart';

class AggrementModel with ChangeNotifier {
  final String? aggrementID;
  final String? contractorID;
  final String? customerID;

  final List? estimatedCharges;
  final List? estimatedDays;
  final DateTime? startDate;
  final List? services;
  final DateTime? endDate;

  final String? details;
  final bool? status;
  AggrementModel({
    this.estimatedCharges,
    this.estimatedDays,
    this.details,
    this.aggrementID,
    this.contractorID,
    this.customerID,
    this.startDate,
    this.services,
    this.endDate,
    this.status,
  });
  factory AggrementModel.fromMap(
      {required Map<String, dynamic> map, required String aggrementID}) {
    return AggrementModel(
      aggrementID: aggrementID,
      contractorID: map["contractorID"],
      customerID: map["customerID"],
      services: map["services"],
      startDate: map["startDate"].toDate(),
      endDate: map["endDate"].toDate(),
      status: map["status"],
      details: map["details"],
      estimatedDays: map["estimatedDays"],
      estimatedCharges: map["estimatedCharges"],
    );
  }
}
