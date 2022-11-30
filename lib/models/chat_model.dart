import 'package:flutter/cupertino.dart';

class ChatModel with ChangeNotifier {
  final String? otherID;
  final String? userID;
  factory ChatModel.fromMap(
      {required Map<String, dynamic> map, required String userID}) {
    return ChatModel(
      userID: userID,
      otherID: map["with"],
    );
  }

  ChatModel({
    this.otherID,
    this.userID,
  });
}
