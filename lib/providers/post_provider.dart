import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:housecontractors/models/post_model.dart';

class PostProvider with ChangeNotifier {
  List<PostModel> _postList = [];

  List<PostModel> get getPostsList => _postList;

  Future<void> fetch() async {
    await FirebaseFirestore.instance.collection("c_post").get().then(
          (QuerySnapshot<Map<String, dynamic>> snapshot) => {
            _postList = [],
            for (var doc in snapshot.docs)
              {
                _postList.insert(
                  0,
                  PostModel.fromMap(map: doc.data(), postID: doc.id),
                ),
              },
          },
        );
    notifyListeners();
  }
}
