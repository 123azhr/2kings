import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../models/orders_model.dart';

class OrdersProvider with ChangeNotifier {
  List<OrdersModel> _list = [];

  List<OrdersModel> get getList => _list;

  final loggedInUser = FirebaseAuth.instance.currentUser;
  Future<void> fetch() async {
    await FirebaseFirestore.instance
        .collection("orders")
        .where("contractorID", isEqualTo: loggedInUser!.uid)
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

  // List<OrdersModel> getChatByID(String otherID) {
  //   return _list
  //       .where((element) => element.otherID!.trim() == otherID.trim())
  //       .toList();
  // }
}
