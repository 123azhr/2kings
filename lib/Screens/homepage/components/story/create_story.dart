import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:housecontractors/widgets/mycontainer.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../../helper/size_configuration.dart';
import '../../../../providers/story_provider.dart';
import '../../../../providers/user_provider.dart';

class CreateStory extends StatefulWidget {
  const CreateStory({super.key});

  @override
  State<CreateStory> createState() => _CreateStoryState();
}

class _CreateStoryState extends State<CreateStory> {
  String _imagePath = "";
  File? _selectedImageFile;
  bool? _isProductImageSelected = true;

  @override
  initState() {
    pickImage();
    print(_imagePath);
    // this is called when the class is initialized or called for the first time
    super
        .initState(); //  this is the material super constructor for init state to link your instance initState to the global initState context
  }

  void pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final _image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _selectedImageFile = File(_image!.path);
      _imagePath = _image.path;
      _isProductImageSelected = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final loggedInUser =
        userProvider.getUserByID(FirebaseAuth.instance.currentUser!.uid);
    final storyProvider = Provider.of<StoryProvider>(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            "Share Story",
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
                        backgroundImage: NetworkImage(
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
                    Spacer(),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 255, 210, 32),
                        ),
                        minimumSize: MaterialStateProperty.all(
                          Size(setWidth(6), setHeight(6)),
                        ),
                      ),
                      onPressed: () {
                         
                        var imageURL =
                              storyProvider.uploadImageToStorage(
                                imagePath: _imagePath,
                                userID: loggedInUser.userID);
                        print(imageURL);
                        
                        storyProvider.uploadImageDataToFireStore(
                            imageURL:  imageURL.toString(),
                            userID: loggedInUser.userID,
                            userName: loggedInUser.name);
                        Navigator.pop(context);
                        Future.delayed(const Duration(milliseconds: 0))
                            .then((value) async {
                          await storyProvider.fetch();
                        });
                      },
                      child: Text("Share",
                          style:
                              TextStyle(fontSize: 18, color: Colors.black87)),
                    ),
                  ],
                ),
                _selectedImageFile != null
                    ? MyContainer(
                        width: setWidth(100),
                        height: setHeight(40),
                        child: Image.file(_selectedImageFile!),
                      )
                    : MyContainer(
                        height: setHeight(40),
                        child: InkWell(
                            child: const Icon(Icons.add_a_photo), onTap: () {}),
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
