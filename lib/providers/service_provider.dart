import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import '../models/service_model.dart';

class ServiceProvider with ChangeNotifier {
  List<ServiceModel> _list = [];

  List<ServiceModel> get getList => _list;

  Future<void> fetch() async {
    await FirebaseFirestore.instance.collection("c_services").get().then(
          (QuerySnapshot<Map<String, dynamic>> snapshot) => {
            _list = [],
            for (var doc in snapshot.docs)
              {
                _list.insert(
                  0,
                  ServiceModel.fromMap(map: doc.data(), serviceID: doc.id),
                ),
              },
          },
        );
    notifyListeners();
  }
}