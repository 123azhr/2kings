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

  Future<void> uploadMessageDataToFireStore({
    bool? type,
    String? chatWith,
    String? messagetxt,
    String? aggrementID,
    DateTime? createdAt,
  }) async {
    DocumentReference<Map<String, dynamic>> doc = await FirebaseFirestore
        .instance
        .collection("chats")
        .doc(loggedInUser!.uid)
        .collection("messages")
        .add({
      "with": chatWith,
      "type": type,
      "text": messagetxt,
      "createdAt": createdAt,
      "aggrementID": aggrementID,
    });
    _list.insert(
      0,
      MessageModel(
        chatWith: chatWith,
        createdAt: createdAt,
        messageID: doc.id,
        messageTxt: messagetxt,
        type: type,
        aggrementID: aggrementID,
      ),
    );
    notifyListeners();
  }
}
