import 'package:flutter/material.dart';

class MessageModel with ChangeNotifier {
  final String? messageID;
  final String? createdAt;
  final String? messageTxt;
  final bool? msgType;
  factory MessageModel.fromMap(
      {required Map<String, dynamic> map, required String messageID}) {
    return MessageModel(
        messageID: messageID,
        messageTxt: map["text"],
        createdAt: map["createdAt"],
        msgType: map["msgType"]);
  }

  MessageModel({
    this.msgType,
    this.messageID,
    this.createdAt,
    this.messageTxt,
  });
}
