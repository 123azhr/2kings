import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import '../models/user_model.dart';

class UserProvider with ChangeNotifier {
  List<UserModel> _list = [];

  List<UserModel> get getList => _list;

  Future<void> fetch() async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc("Y1DImckjzK5z2khAEi7o")
        .collection("contractors")
        .doc("XFVuGYHjDAQtJeew6OVxKraVqQ73") //userID
        .get()
        .then((DocumentSnapshot snapshot) {
      _list = [];
      Map<String, dynamic> dataMap = snapshot.data() as Map<String, dynamic>;
      _list.insert(
          0, UserModel.fromMap(map: dataMap, userID: snapshot.id.trim()));
    }); 
    notifyListeners();
  }
 
  UserModel getUserByID(String userID) {
    return _list
        .where((element) => element.userID!.trim() == userID)
        .toList()
        .elementAt(0);
  }
}
