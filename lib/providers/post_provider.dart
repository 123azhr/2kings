import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:housecontractors/models/post_model.dart';

class PostProvider with ChangeNotifier {
  List<PostModel> _list = [];

  List<PostModel> get getList => _list;

  Future<void> fetch() async {
    await FirebaseFirestore.instance.collection("c_post").get().then(
          (QuerySnapshot<Map<String, dynamic>> snapshot) => {
            _list = [],
            for (var doc in snapshot.docs)
              {
                _list.insert(
                  0,
                  PostModel.fromMap(map: doc.data(), postID: doc.id),
                ),
              },
          },
        );
    notifyListeners();
  }

  List<PostModel> getPostByID(String userID) {
    return _list.where((element) => element.userID!.trim() == userID).toList();
  }
}
