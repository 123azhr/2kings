import 'package:flutter/material.dart';

class MessageModel with ChangeNotifier {
  final String? messageID;
  final DateTime? createdAt;
  final String? messageTxt;
  final String? chatWith;
  final String? aggrementID;
  final bool? type;
  
  factory MessageModel.fromMap(
      {required Map<String, dynamic> map, required String messageID}) {
    return MessageModel(
      messageID: messageID,
      messageTxt: map["text"],
      createdAt: map["createdAt"].toDate(),
      chatWith: map["with"],
      type: map["type"],
      aggrementID: map["aggrementID"],
    );
  }

  MessageModel({
    this.aggrementID,
    this.type,
    this.chatWith,
    this.messageID,
    this.createdAt,
    this.messageTxt,
  });
}
