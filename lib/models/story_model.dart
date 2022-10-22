import 'package:flutter/cupertino.dart';

class StoryModel with ChangeNotifier {
  final String? storyID;
  final String? userID;
  final String? url;
  final DateTime? postedTime;
  StoryModel({
    this.storyID,
    this.userID,
    this.url,
    this.postedTime,
  });

  factory StoryModel.fromMap(
      {required Map<String, dynamic> map, required String storyID}) {
    return StoryModel(
      storyID: storyID,
      userID: map["contractor_id"],
      postedTime: map["time"].toDate(),
      url: map["url"],
    );
  }
}
