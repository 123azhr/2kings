import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import '../models/chat_model.dart';

class ChatProvider with ChangeNotifier {
  List<ChatModel> _list = [];

  List<ChatModel> get getList => _list;

  Future<void> fetch() async {
    await FirebaseFirestore.instance.collection("c_chats").get().then(
          (QuerySnapshot<Map<String, dynamic>> snapshot) => {
            _list = [],
            for (var doc in snapshot.docs)
              {
                _list.insert(
                  0,
                  ChatModel.fromMap(map: doc.data(), chatID: doc.id),
                ),
              },
          },
        );
    notifyListeners();
  }
}
