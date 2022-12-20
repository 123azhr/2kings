// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import '../models/current_user.dart';

// class ContractorsProvider with ChangeNotifier {
//   List<ContractorsModel> _list = [];

//   List<ContractorsModel> get getList => _list;
//   void clearList() {
//     _list.clear();
//     notifyListeners();
//   }

//   Future<void> fetch(String? userID) async {
//     if (userID != null) {
//       await FirebaseFirestore.instance
//           .collection("users")
//           .doc("Y1DImckjzK5z2khAEi7o")
//           .collection("contractors")
//           .doc(userID.trim()) //userID
//           .get()
//           .then((DocumentSnapshot snapshot) {
//         _list = [];
//         Map<String, dynamic> dataMap = snapshot.data() as Map<String, dynamic>;
//         _list.insert(0,
//             ContractorsModel.fromMap(map: dataMap, userID: snapshot.id.trim()));
//       });
//       notifyListeners();
//     }
//   }

//   ContractorsModel getUserByID(String userID) {
//     return _list
//         .where((element) => element.userID!.trim() == userID)
//         .toList()
//         .elementAt(0);
//   }
// }
