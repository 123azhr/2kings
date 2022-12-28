import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../models/orders_model.dart';

class OrdersProvider with ChangeNotifier {
  List<OrdersModel> _list = [];

  List<OrdersModel> get getList => _list;

  final loggedInUser = FirebaseAuth.instance.currentUser;
  void clearList() {
    _list.clear();
  }

  Future<void> fetch() async {
    if (loggedInUser != null) {
      await FirebaseFirestore.instance
          .collection("orders")
          .doc(loggedInUser!.uid)
          .collection("orderDetails")
          .get()
          .then(
            (QuerySnapshot<Map<String, dynamic>> snapshot) => {
              _list = [],
              for (var doc in snapshot.docs)
                {
                  _list.insert(
                    0,
                    OrdersModel.fromMap(map: doc.data(), orderID: doc.id),
                  ),
                },
            },
          );
      notifyListeners();
    }
  }

  updateStatus(String orderID, String status, String customerID) async {
    await FirebaseFirestore.instance
        .collection("orders")
        .doc(loggedInUser!.uid)
        .collection("orderDetails")
        .doc(orderID)
        .update({"status": status});
    await FirebaseFirestore.instance
        .collection("chats")
        .doc(customerID)
        .collection("agreements")
        .doc(orderID)
        .update({"status": status});
    fetch();
  }

  updateTotal(String orderID, String inventoryTotal, String serviceTotal,
      String customerID) async {
    double grandTotal =
        double.parse(inventoryTotal) + double.parse(serviceTotal);
    await FirebaseFirestore.instance
        .collection("orders")
        .doc(loggedInUser!.uid)
        .collection("orderDetails")
        .doc(orderID)
        .update({
      "inventoryTotal": inventoryTotal,
      "serviceTotal": serviceTotal,
      "grandTotal": grandTotal.toString()
    });
    await FirebaseFirestore.instance
        .collection("chats")
        .doc(customerID)
        .collection("agreements")
        .doc(orderID)
        .update({
      "inventoryTotal": inventoryTotal,
      "serviceTotal": serviceTotal,
      "grandTotal": grandTotal.toString()
    });
    fetch();
  }

  List<OrdersModel> getOrderByID(String aggrementID) {
    return _list
        .where((element) => element.aggrementID!.trim() == aggrementID.trim())
        .toList();
  }
}
