import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/inventory_model.dart';

class InventoryProvider with ChangeNotifier {
  final loggedInUser = FirebaseAuth.instance.currentUser;
  List<InventoryModel> _list = [];

  List<InventoryModel> get getInventoryList => _list;
  void clearList() {
    _list.clear();
  }

  Future<void> fetchInventory() async {
    await FirebaseFirestore.instance
        .collection("orders")
        .doc(" " + loggedInUser!.uid)
        .collection("logs")
        .doc("M4XynyYl03rreQUdtwg6")
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
}
