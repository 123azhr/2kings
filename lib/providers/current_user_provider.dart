import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import '../models/current_user.dart';

class CurrentUserProvider with ChangeNotifier {
  List<CurrentUserModel> _list = [];

  List<CurrentUserModel> get getList => _list;

  final String? _user = FirebaseAuth.instance.currentUser?.uid;
  void clearList() {
    _list.clear();
  }

  Future<void> fetch() async {
    clearList();
    if (_user != null) {
      await FirebaseFirestore.instance
          .collection("users")
          .doc("Y1DImckjzK5z2khAEi7o")
          .collection("contractors")
          .doc(_user) //userID
          .get()
          .then((DocumentSnapshot snapshot) {
        _list = [];
        Map<String, dynamic> dataMap = snapshot.data() as Map<String, dynamic>;
        _list.insert(0,
            CurrentUserModel.fromMap(map: dataMap, userID: snapshot.id.trim()));
      });
      notifyListeners();
    }
  }

  CurrentUserModel getCurrentUser() {
    return _list
        .where((element) => element.userID!.trim() == _user)
        .toList()
        .elementAt(0);
  }
}
