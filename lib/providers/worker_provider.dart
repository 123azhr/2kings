import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import '../models/workers_model.dart';

class WorkerProvider with ChangeNotifier {
  List<WorkerModel> _list = [];

  List<WorkerModel> get getList => _list;

  Future<void> fetch() async {
    await FirebaseFirestore.instance.collection("c_user").get().then(
          (QuerySnapshot<Map<String, dynamic>> snapshot) => {
            _list = [],
            for (var doc in snapshot.docs)
              {
                _list.insert(
                  0,
                  WorkerModel.fromMap(map: doc.data(), userID: doc.id),
                ),
              },
          },
        );
    notifyListeners();
  }
}
