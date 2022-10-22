import 'package:flutter/cupertino.dart';

class ChatModel with ChangeNotifier {
  final String? customerMsg;
  final String? myMassages;
  final String? chatID;

  ChatModel({
    this.customerMsg,
    this.myMassages,
    this.chatID,
  });

  factory ChatModel.fromMap(
      {required Map<String, dynamic> map, required String chatID}) {
    return ChatModel(
      chatID: chatID,
      myMassages: map["my_messages"],
      customerMsg: map["customer_messages"],
    );
  }
}
