import 'package:flutter/cupertino.dart';

class MessageModel with ChangeNotifier {
  final String? messageID;

  final String? createdAt;
  final String? messagetxt;
  final String? userID;
  final String? otherID;

  factory MessageModel.fromMap(
      {required Map<String, dynamic> map, required String messageID}) {
    return MessageModel(
        messageID: messageID,
        messagetxt: map["text"],
        otherID: map["toID"],
        userID: map["userID"]);
  }

  MessageModel(
      {this.messageID,
      this.createdAt,
      this.messagetxt,
      this.userID,
      this.otherID});
}
