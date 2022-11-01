import 'dart:io';
import 'package:path/path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
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

  Future<void> uploadDataToFireStore(
      {String? userID, String? imageURL, String? userName}) async {
    await FirebaseFirestore.instance.collection("c_post").add({
      "post_imgVideo": imageURL,
      "userName": userName,
      "post_userID": userID,
      "post_date": DateTime.now(),
      "post_comments": [],
      "post_likes": [],
    });
  }

  Future<String?> uploadProductImageToStorage(
      {required String? imagePath}) async {
    File imageFile = File(imagePath!);
    String _imageBaseName = basename(imageFile.path);
    Reference imageReference = FirebaseStorage.instance
        .ref()
        .child("images")
        .child("productImages")
        .child(_imageBaseName);
    await imageReference.putFile(imageFile);
    String getImageUrl = await imageReference.getDownloadURL();
    notifyListeners();
    return getImageUrl;
  }

  Future<void> deleteProductImageFromStorage(
      {required String? imageURL}) async {
    String? imageName = imageURL!.split('2F')[2].split('?alt')[0];
    await FirebaseStorage.instance
        .ref()
        .child("images")
        .child("productImages")
        .child(imageName)
        .delete();
    notifyListeners();
  }
}
