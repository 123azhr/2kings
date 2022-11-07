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

  Future<void> uploadImageDataToFireStore(
      {String? userID,
      String? imageURL,
      String? userName,
      String? caption = ""}) async {
    await FirebaseFirestore.instance.collection("c_post").add({
      "post_imgVideo": imageURL,
      "userName": userName,
      "post_userID": userID,
      "post_date": DateTime.now(),
      "post_comments": [],
      "post_likes": [],
      "caption": caption,
    });
  }

  Future<String?> uploadImageToStorage(
      {required String? imagePath,
      required String? userID,
      required String? imageType}) async {
    File imageFile = File(imagePath!);

    String _imageBaseName = basename(imageFile.path);
    Reference imageReference = FirebaseStorage.instance
        .ref()
        .child("images")
        .child(userID!)
        .child(imageType!)
        .child(_imageBaseName);
    await imageReference.putFile(imageFile);
    String getImageUrl = await imageReference.getDownloadURL();
    notifyListeners();
    return getImageUrl;
  }

  Future<void> deleteImageFromStorage(
      {required String? imageURL,
      required String? userID,
      required String? imageType}) async {
    String? imageName = imageURL!.split('2F')[2].split('?alt')[0];
    await FirebaseStorage.instance
        .ref()
        .child("images")
        .child(userID!)
        .child(imageType!)
        .child(imageName)
        .delete();
    notifyListeners();
  }
}
