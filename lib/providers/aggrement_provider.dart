import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/aggrement_model.dart';

class AggrementProvider with ChangeNotifier {
  List<AggrementModel> _list = [];

  List<AggrementModel> get getList => _list;

  final loggedInUser = FirebaseAuth.instance.currentUser;
  Future<void> fetch() async {
    await FirebaseFirestore.instance
        .collection("chats")
        .doc(loggedInUser!.uid)
        .collection("aggrements")
        .get()
        .then(
          (QuerySnapshot<Map<String, dynamic>> snapshot) => {
            _list = [],
            for (var doc in snapshot.docs)
              {
                _list.insert(
                  0,
                  AggrementModel.fromMap(map: doc.data(), aggrementID: doc.id),
                ),
              },
          },
        );
    notifyListeners();
  }

  AggrementModel getAggrementByID(String aggrementID) {
    return _list
        .where((element) => element.aggrementID!.trim() == aggrementID.trim())
        .first;
  }

  Future<String> uploadAggrementDataToFireStore({
    String? contractorID,
    String? details,
    String? customerID,
    List? estimatedCharges,
    List? estimatedDays,
    DateTime? startDate,
    List? services,
    DateTime? endDate,
    bool? status,
  }) async {
    DocumentReference<Map<String, dynamic>> doc = await FirebaseFirestore
        .instance
        .collection("chats")
        .doc(loggedInUser!.uid)
        .collection("aggrements")
        .add({
      "contractorID": contractorID,
      "estimatedCharges": estimatedCharges,
      "estimatedDays": estimatedDays,
      "customerID": customerID,
      "startDate": startDate,
      "endDate": endDate,
      "services": services,
      "status": status,
      "details": details,
    });
    _list.insert(
      0,
      AggrementModel(
        aggrementID: doc.id,
        contractorID: contractorID,
        estimatedCharges: estimatedCharges,
        estimatedDays: estimatedDays,
        customerID: customerID,
        services: services,
        startDate: startDate,
        endDate: endDate,
        status: status,
        details: details,
      ),
    );

    notifyListeners();
    return doc.id;
  }
}
