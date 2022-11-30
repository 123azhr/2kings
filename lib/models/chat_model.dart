import 'package:flutter/cupertino.dart';

class ChatModel with ChangeNotifier {
  final String? userID;
  final String? otherID;
  final String? chatID;
  final Map? messagesID;
  factory ChatModel.fromMap(
      {required Map<String, dynamic> map, required String chatID}) {
    return ChatModel(
        chatID: chatID,
        otherID: map["otherID"],
        messagesID: map["messages"],
        userID: map["userID"]);
  }

  ChatModel({
    this.messagesID,
    this.userID,
    this.otherID,
    this.chatID,
  });
}
