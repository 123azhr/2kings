import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:housecontractors/Screens/loginSignup/login.dart';
import 'package:housecontractors/Screens/loginSignup/mytextfield.dart';
import 'package:housecontractors/providers/user_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../helper/size_configuration.dart';

class UserForm extends StatefulWidget {
  List userData;
  UserForm({
    Key? key,
    required this.userData,
  }) : super(key: key);
  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController cnicController = TextEditingController();
  final TextEditingController genderController = TextEditingController();

  final TextEditingController contactController = TextEditingController();

  String dropdownvalue = 'Select';
  List<String> items = <String>[
    'Male',
    'Female',
  ];
  String _imagePath = "";
  File? _selectedImageFile;

  void pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final _image = await _picker.pickImage(source: ImageSource.gallery);
    if (_image?.path != null) {
      setState(() {
        _selectedImageFile = File(_image!.path);
        _imagePath = _image.path;
      });
    }
  }

  // uploadUserData() async {
  //   final userProvider = Provider.of<UserProvider>(context, listen: false);
  //   final loggedInUser =  Provider.of<UserProvider>(context, listen: false);
  //   showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: ((context) => const Center(child: CircularProgressIndicator())),
  //   );
  //   try {
  //     DateTime date = DateTime.now();
  //     String imageURL = await userProvider.uploadUserImageToStorage(
  //         imagePath: _imagePath, userID: loggedInUser.userID);

  //     await postProvider.uploadImageDataToFireStore(
  //       imageURL: imageURL,
  //       userID: loggedInUser.userID,
  //       userName: loggedInUser.name,
  //       date: date,
  //       caption: "",
  //     );

  //     await postProvider.fetch();
  //     Navigator.pop(context);
  //     Navigator.pop(context);

  //     // Future.delayed(const Duration(milliseconds: 0)).then((value) async {
  //     //   await postProvider.fetch();
  //     // });
  //   } on FirebaseException catch (e) {
  //     print(e.message);
  //     print(e.code);
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: getProportionateScreenWidth(40),
          leading: Image.asset(
            "assets/images/logo-black-half.png",
            fit: BoxFit.contain,
          ),
          title: const Text(
            "Signup",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          centerTitle: true,
          elevation: 1,
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SizedBox(
              height: setHeight(50),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MyTextField(
                      width: setWidth(95),
                      radius: 20,
                      hintText: "Full Name",
                    ),
                    Row(
                      children: [
                        MyTextField(
                          width: setWidth(35),
                          radius: 20,
                          hintText: "Gender",
                        ),
                        const Spacer(),
                        MyTextField(
                          width: setWidth(45),
                          radius: 20,
                          hintText: "Contact",
                        ),
                      ],
                    ),
                    MyTextField(
                      width: setWidth(45),
                      radius: 20,
                      hintText: "CNIC",
                    ),
                    SizedBox(
                      height: setHeight(5),
                    ),
                    Center(
                      child: SizedBox(
                        width: 150,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            //background color of button
                            side: const BorderSide(
                              width: 1,
                            ), //border width and color
                            elevation: 3, //elevation of button
                            shape: RoundedRectangleBorder(
                                //to set border radius to button
                                borderRadius: BorderRadius.circular(30)),
                            padding: const EdgeInsets.all(20),

                            //content padding inside button
                          ),
                          onPressed: () {
                            widget.userData.addAll([
                              nameController.text,
                              genderController.text,
                              cnicController.text,
                              contactController.text
                            ]);

                            widget.userData.removeRange(0, 4);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Login(),
                                ));
                          },
                          child: const Text("Continue"),
                        ),
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
