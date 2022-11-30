import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:housecontractors/models/message_model.dart';
import '../models/chat_model.dart';

class ChatProvider with ChangeNotifier {
  List<ChatModel> _list = [];

  List<ChatModel> get getList => _list;

  List<MessageModel> _msglist = [];

  List<MessageModel> get getmsgList => _msglist;

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
                  ChatModel.fromMap(map: doc.data(), userID: doc.id),
                ),
              },
          },
        );
    notifyListeners();
  }
  // Future<void> fetch() async {
  //   await FirebaseFirestore.instance
  //       .collection("chats")
  //       .doc(loggedInUser!.uid).collection("messages")
  //       .get()
  //       .then((DocumentSnapshot snapshot) {
  //     _list = [];
  //     Map<String, dynamic> dataMap = snapshot.data() as Map<String, dynamic>;
  //     _list.insert(
  //         0, ChatModel.fromMap(map: dataMap, userID: snapshot.id.trim()));

  //     print(_list);
  //   });
  //   notifyListeners();
  // }

  List<ChatModel> getChatByID(String otherID) {
    return _list
        .where((element) => element.otherID!.trim() == otherID.trim())
        .toList();
  }
}
