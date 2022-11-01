import 'dart:io';

import 'package:flutter/material.dart';
import 'package:housecontractors/widgets/mycontainer.dart';
import 'package:image_picker/image_picker.dart';

import '../../helper/size_configuration.dart';

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
    setState(() {
      _selectedImageFile = File(_image!.path);
      _imagePath = _image.path;
      _isProductImageSelected = true;
    });
  }

  @override
  Widget build(BuildContext context) {
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
          actions: [],
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
                      onPressed: () {
                        

                      },
                      child: Text("Post",
                          style:
                              TextStyle(fontSize: 18, color: Colors.black87)),
                    ),
                  ],
                ),
                _selectedImageFile != null
                    ? Container(
                        height: setHeight(40),
                        child: Image.file(_selectedImageFile!),
                      )
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
