import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/message_model.dart';

class MessageProvider with ChangeNotifier {
  List<MessageModel> _list = [];

  List<MessageModel> get getList => _list;

  final loggedInUser = FirebaseAuth.instance.currentUser;
  Future<void> fetch() async {
    await FirebaseFirestore.instance
        .collection("chats")
        .doc(loggedInUser!.uid)
        .collection("messages")
        .get()
        .then(
          (QuerySnapshot<Map<String, dynamic>> snapshot) => {
            _list = [],
            for (var doc in snapshot.docs)
              {
                _list.insert(
                  0,
                  MessageModel.fromMap(map: doc.data(), messageID: doc.id),
                ),
              },
          },
        );
    notifyListeners();
  }

}
