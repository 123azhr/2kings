import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../models/story_model.dart';

class StoryProvider with ChangeNotifier {
  List<StoryModel> _list = [];

  List<StoryModel> get getList => _list;

  Future<void> fetch() async {
    await FirebaseFirestore.instance.collection("stories").get().then(
          (QuerySnapshot<Map<String, dynamic>> snapshot) => {
            _list = [],
            for (var doc in snapshot.docs)
              {
                _list.insert(
                  0,
                  StoryModel.fromMap(map: doc.data(), storyID: doc.id),
                ),
              },
          },
        );
    notifyListeners();
  }

  List<StoryModel> getPostByID(String userID) {
    return _list.where((element) => element.userID!.trim() == userID).toList();
  }
}
