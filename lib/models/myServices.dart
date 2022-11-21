// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';

// class MyServices with ChangeNotifier {
//   final String? id;
//   MyServices({this.id});
// }

// class MyServicesProvider with ChangeNotifier {
//   List<MyServices> myServicesList = [];

//   fetch() async {
//     await FirebaseFirestore.instance
//         .collection("users")
//         .doc("Y1DImckjzK5z2khAEi7o")
//         .collection("contractors")
//         .doc("XFVuGYHjDAQtJeew6OVxKraVqQ73")
//         .get()
//         .then((value) {
//       myServicesList = [];
//       myServicesList = value.get('services');
//     });
//     notifyListeners();
//   }

//   addServices(List<String> newList) async {
//     await FirebaseFirestore.instance
//         .collection("users")
//         .doc("Y1DImckjzK5z2khAEi7o")
//         .collection("contractors")
//         .doc("XFVuGYHjDAQtJeew6OVxKraVqQ73")
//         .update({"services": newList});
//     await fetch();
//     notifyListeners();
//   }
// }
