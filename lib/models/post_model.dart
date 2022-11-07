import 'package:flutter/cupertino.dart';

class PostModel with ChangeNotifier {
  final String? userID;
  final String? postID;
  final String? imageURL;
  final DateTime? postedTime;
  final String? userName;
  final String? caption;
  PostModel(
      {this.userID,
      this.postID,
      this.imageURL,
      this.postedTime,
      this.userName,
      this.caption});

  factory PostModel.fromMap(
      {required Map<String, dynamic> map, required String postID}) {
    return PostModel(
        postID: postID,
        userID: map["post_userID"],
        postedTime: map["post_date"].toDate(),
        imageURL: map["post_imgVideo"],
        userName: map["userName"],
        caption: map["caption"]);
  }
}
