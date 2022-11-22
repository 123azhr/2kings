import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:housecontractors/widgets/mycontainer.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  @override
  initState() {
    pickImage();
    // this is called when the class is initialized or called for the first time
    super
        .initState(); //  this is the material super constructor for init state to link your instance initState to the global initState context
  }

  uploadStory() async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final loggedInUser = userProvider.getCurrentUser();
    final storyProvider = Provider.of<StoryProvider>(context, listen: false);
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: ((context) => const Center(child: CircularProgressIndicator())),
    );
    try {
      DateTime date = DateTime.now();
      String? imageURL = await storyProvider.uploadImageToStorage(
          imagePath: _imagePath, userID: loggedInUser.userID);

      await storyProvider.uploadImageDataToFireStore(
        imageURL: imageURL,
        userID: loggedInUser.userID,
        userName: loggedInUser.name,
        caption: "",
      );

      await storyProvider.fetch();
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
                        // var imageURL = storyProvider.uploadImageToStorage(
                        //     imagePath: _imagePath, userID: loggedInUser.userID);
                        // print(imageURL);

                        // storyProvider.uploadImageDataToFireStore(
                        //     imageURL: imageURL.toString(),
                        //     userID: loggedInUser.userID,
                        //     userName: loggedInUser.name);
                        // Navigator.pop(context);
                        // Future.delayed(const Duration(milliseconds: 0))
                        //     .then((value) async {
                        //   await storyProvider.fetch();
                        // });
                        uploadStory();
                      },
                      child: Text("Share",
                          style:
                              TextStyle(fontSize: 18, color: Colors.black87)),
                    ),
                  ],
                ),
                _selectedImageFile != null
                    ? Stack(
                        alignment: AlignmentDirectional.topEnd,
                        children: [
                          MyContainer(
                            width: setWidth(100),
                            height: setHeight(40),
                            child: Image.file(_selectedImageFile!),
                          ),
                          FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  _selectedImageFile = null;
                                });
                              },
                              child: Icon(Icons.cancel),
                              isExtended: false,
                              mini: true),
                        ],
                      )
                    : MyContainer(
                        height: setHeight(40),
                        child: InkWell(
                            child: const Icon(Icons.add_a_photo),
                            onTap: () {
                              pickImage();
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
