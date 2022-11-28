import 'package:flutter/cupertino.dart';

class ChatModel with ChangeNotifier {
  final List? messagesID;
  final String? userID;
  final String? otherID;
  final String? chatID;
  factory ChatModel.fromMap(
      {required Map<String, dynamic> map, required String chatID}) {
    return ChatModel(
        chatID: chatID,
        messagesID: map["messagesID"],
        otherID: map["otherID"],
        userID: map["userID"]);
  }

  ChatModel({
    this.messagesID,
    this.userID,
    this.otherID,
    this.chatID,
  });
}
