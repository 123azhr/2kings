import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:housecontractors/models/service_log_model.dart';

class ServiceLogsProvider with ChangeNotifier {
  final loggedInUser = FirebaseAuth.instance.currentUser;
  List<ServiceLogModel> _servicelist = [];

  List<ServiceLogModel> get getServicelist => _servicelist;
  void clearList() {
    _servicelist.clear();
    notifyListeners();
  }

  Future<void> fetchServiceLog() async {
    await FirebaseFirestore.instance
        .collection("orders")
        .doc(" " + loggedInUser!.uid)
        .collection("logs")
        .doc("M4XynyYl03rreQUdtwg6")
        .collection("services")
        .get()
        .then(
          (QuerySnapshot<Map<String, dynamic>> snapshot) => {
            _servicelist = [],
            for (var doc in snapshot.docs)
              {
                _servicelist.insert(
                  0,
                  ServiceLogModel.fromMap(map: doc.data(), serviceID: doc.id),
                ),
              },
          },
        );
    notifyListeners();
  }

  Future<void> uploadItemDataToFireStore({
    String? serviceName,
    String? noOfDays,
    String? total,
    String? perDay,
  }) async {
    DocumentReference<Map<String, dynamic>> doc = await FirebaseFirestore
        .instance
        .collection("orders")
        .doc(" " + loggedInUser!.uid)
        .collection("logs")
        .doc("M4XynyYl03rreQUdtwg6")
        .collection("services")
        .add({
      "serviceName": serviceName,
      "noOfDays": noOfDays,
      "total": total,
      "perDay": perDay,
    });
    _servicelist.insert(
      0,
      ServiceLogModel(
          serviceID: doc.id,
          serviceName: serviceName,
          perDay: perDay,
          noOfDays: noOfDays,
          total: total),
    );
    notifyListeners();
  }

  List<ServiceLogModel> getserviceByID(String serviceLogID) {
    return _servicelist
        .where((element) => element.serviceID!.trim() == serviceLogID.trim())
        .toList();
  }
}
