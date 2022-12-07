import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:housecontractors/models/service_log_model.dart';
import '../models/inventory_model.dart';

class LogsProvider with ChangeNotifier {
  List<InventoryModel> _list = [];

  List<InventoryModel> get getInventoryList => _list;

  final loggedInUser = FirebaseAuth.instance.currentUser;
  Future<void> fetchInventory(String logID) async {
    await FirebaseFirestore.instance
        .collection("orders")
        .doc(" " + loggedInUser!.uid)
        .collection("logs")
        .doc(logID.trim())
        .collection("inventory")
        .get()
        .then(
          (QuerySnapshot<Map<String, dynamic>> snapshot) => {
            _list = [],
            for (var doc in snapshot.docs)
              {
                _list.insert(
                  0,
                  InventoryModel.fromMap(map: doc.data(), inventoryID: doc.id),
                ),
              },
          },
        );
    notifyListeners();
  }

  InventoryModel getInventoryByID(String logsID) {
    return _list
        .where((element) => element.inventoryID!.trim() == logsID.trim())
        .first;
  }

  List<ServiceLogModel> _servicelist = [];

  List<ServiceLogModel> get getServicelist => _servicelist;
  void clearList(){
    _list.clear();
  }
  Future<void> fetchServiceLog(String logID) async {
    await FirebaseFirestore.instance
        .collection("orders")
        .doc(" " + loggedInUser!.uid)
        .collection("logs")
        .doc(logID.trim())
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

  List<ServiceLogModel> getserviceByID(String serviceLogID) {
    return _servicelist
        .where((element) => element.serviceID!.trim() == serviceLogID.trim())
        .toList();
  }
}
