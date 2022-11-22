import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:housecontractors/widgets/mycontainer.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../helper/size_configuration.dart';
import '../../providers/post_provider.dart';
import '../../providers/user_provider.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({super.key});

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  String _imagePath = "";
  File? _selectedImageFile;
  bool? _isProductImageSelected = true;

  void pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final _image = await _picker.pickImage(source: ImageSource.gallery);
    if (_selectedImageFile != null) {
      setState(() {
        _selectedImageFile = File(_image!.path);
        _imagePath = _image.path;
        _isProductImageSelected = true;
      });
    }
  }

  uploadPost() async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final loggedInUser = userProvider.getCurrentUser();
    final postProvider = Provider.of<PostProvider>(context, listen: false);
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: ((context) => const Center(child: CircularProgressIndicator())),
    );
    try {
      DateTime date = DateTime.now();
      String imageURL = await postProvider.uploadImageToStorage(
          imagePath: _imagePath,
          imageType: "posts",
          userID: loggedInUser.userID);

      await postProvider.uploadImageDataToFireStore(
        imageURL: imageURL,
        userID: loggedInUser.userID,
        userName: loggedInUser.name,
        date: date,
        caption: "",
      );

      await postProvider.fetch();
      Navigator.pop(context);
      Navigator.pop(context);

      // Future.delayed(const Duration(milliseconds: 0)).then((value) async {
      //   await postProvider.fetch();
      // });
    } on FirebaseException catch (e) {
      print(e.message);
      print(e.code);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final loggedInUser = userProvider.getCurrentUser();
    final postProvider = Provider.of<PostProvider>(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            "Create Post",
            style: TextStyle(
              color: Colors.black,
              fontSize: (kToolbarHeight / 100) * 40,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(
              left: getProportionateScreenWidth(8),
              right: getProportionateScreenWidth(8),
              bottom: MediaQuery.of(context).viewInsets.bottom),
          child: SizedBox(
            height: setHeight(100),
            child: SingleChildScrollView(
              child: Column(children: [
                Row(
                  children: [
                    SizedBox(
                      height: getProportionateScreenHeight(60),
                      width: getProportionateScreenWidth(80),
                      child: const CircleAvatar(
                        backgroundImage: CachedNetworkImageProvider(
                            "https://images.pexels.com/photos/1172253/pexels-photo-1172253.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          "Muhammad Azhar",
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ],
                    ),
                    const Spacer(),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 255, 210, 32),
                        ),
                        fixedSize: MaterialStateProperty.all(
                          Size(setWidth(5), setHeight(5)),
                        ),
                      ),
                      onPressed: () async {
                        // String imageURL = postProvider.uploadImageToStorage(
                        //     imagePath: _imagePath,
                        //     imageType: "posts",
                        //     userID: loggedInUser.userID);
                        // postProvider.uploadImageDataToFireStore(
                        //     imageURL: imageURL,
                        //     userID: loggedInUser.userID,
                        //     userName: loggedInUser.name);
                        await uploadPost();
                        // Navigator.pop(context);
                        // Future.delayed(const Duration(milliseconds: 0))
                        //     .then((value) async {
                        //   await postProvider.fetch();
                        // });
                      },
                      child: Text("Post",
                          style:
                              TextStyle(fontSize: 18, color: Colors.black87)),
                    ),
                  ],
                ),
                _selectedImageFile != null
                    ? Stack(alignment: AlignmentDirectional.topEnd, children: [
                        MyContainer(
                            width: setWidth(100),
                            height: setHeight(40),
                            child: Image.file(_selectedImageFile!))
                      ])
                    : MyContainer(
                        height: setHeight(40),
                        child: InkWell(
                            child: const Icon(Icons.add_a_photo),
                            onTap: () {
                              pickImage();
                              print(_imagePath);
                            }),
                        width: setWidth(100),
                      ),
                TextFormField(
                  maxLines: 20,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    contentPadding:
                        EdgeInsets.all(getProportionateScreenWidth(10)),
                    isCollapsed: true,
                    hintText: "What's in your mind?",
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
