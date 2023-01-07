import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:housecontractors/providers/contractor_provider.dart';

import '../models/agreement_model.dart';

class AgreementProvider with ChangeNotifier {
  List<AgreementModel> _list = [];

  List<AgreementModel> get getList => _list;

  final loggedInUser = currentUserID;
  void clearList() {
    _list.clear();
  }

  Future<void> fetch() async {
    if (loggedInUser != null) {
      await FirebaseFirestore.instance
          .collection("chats")
          .doc(loggedInUser  )
          .collection("agreements")
          .get()
          .then(
            (QuerySnapshot<Map<String, dynamic>> snapshot) => {
              _list = [],
              for (var doc in snapshot.docs)
                {
                  _list.insert(
                    0,
                    AgreementModel.fromMap(
                        map: doc.data(), agreementID: doc.id),
                  ),
                },
            },
          );
      notifyListeners();
    }
  }

  AgreementModel getAgreementByID(String agreementID) {
    return _list
        .where((element) => element.agreementID!.trim() == agreementID.trim())
        .first;
  }

  Future<String> uploadAgreementDataToFireStore({
    String? contractorID,
    String? details,
    String? customerID,
    DateTime? startDate,
    List? services,
    DateTime? endDate,
    bool? status,
  }) async {
    DocumentReference<Map<String, dynamic>> doc = await FirebaseFirestore
        .instance
        .collection("chats")
        .doc(loggedInUser  )
        .collection("agreements")
        .add({
      "contractorID": contractorID,
      "customerID": customerID,
      "startDate": startDate,
      "endDate": endDate,
      "services": services,
      "status": status,
      "details": details,
    });
    await FirebaseFirestore.instance
        .collection("chats")
        .doc(customerID)
        .collection("agreements")
        .doc(doc.id)
        .set({
      "contractorID": contractorID,
      "customerID": customerID,
      "startDate": startDate,
      "endDate": endDate,
      "services": services,
      "status": status,
      "details": details,
    });
    _list.insert(
      0,
      AgreementModel(
        agreementID: doc.id,
        contractorID: contractorID,
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
