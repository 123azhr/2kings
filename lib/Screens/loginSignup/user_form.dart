import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:housecontractors/Screens/Main/dashboard.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'package:housecontractors/Screens/loginSignup/login.dart';
import 'package:housecontractors/Screens/loginSignup/mytextfield.dart';
import 'package:housecontractors/providers/user_provider.dart';

import '../../helper/size_configuration.dart';
import '../../providers/authentication_provider.dart';
import '../../providers/current_user_provider.dart';

class UserForm extends StatefulWidget {
  final String email;
  final String password;
  const UserForm({
    Key? key,
    required this.email,
    required this.password,
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

  loadcurrentUser() async {
    try {
      final currentUserProvider =
          Provider.of<CurrentUserProvider>(context, listen: false);
      await currentUserProvider.fetch();
    } catch (e) {
      print("could'nt load user");
    }
  }

  createAccountandLogin() async {
    await context
        .read<AuthenticationService>()
        .signUp(email: widget.email.trim(), password: widget.password.trim());
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: ((context) => const Center(child: CircularProgressIndicator())),
    );
    context
        .read<AuthenticationService>()
        .signIn(email: widget.email.trim(), password: widget.password.trim());
    Navigator.pop(context);
  }

  uploadUserData(
      {String? cnic,
      String? contactNumber,
      String? email,
      bool? gender,
      String? name,
      String? userID}) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      DateTime date = DateTime.now();
      // String imageURL = await userProvider.uploadUserImageToStorage(
      //     imagePath: _imagePath, userID: loggedInUser!.uid);
      userProvider.uploadUserDataToFireStore(
          userID: userID,
          cnic: cnic,
          contactNumber: contactNumber,
          email: email,
          gender: gender,
          name: name,
          status: true,
          createdDate: date,
          profileImageURL:
              "https://firebasestorage.googleapis.com/v0/b/kings-9b7d2.appspot.com/o/images%2FContractorDefault%2FcontractorDefault.png?alt=media&token=1b2ca997-7138-4a7f-8adb-91043ae36868",
          rating: [],
          services: []);
    } on FirebaseException catch (e) {
      print(e.message);
      print(e.code);
    } catch (e) {
      print(e.toString());
    }
  }

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
                      color: const Color.fromARGB(255, 255, 239, 63),
                      width: setWidth(95),
                      radius: 20,
                      hintText: "Full Name",
                      controller: nameController,
                    ),
                    Row(
                      children: [
                        MyTextField(
                          color: const Color.fromARGB(255, 255, 239, 63),
                          width: setWidth(35),
                          radius: 20,
                          hintText: "Gender",
                          controller: genderController,
                        ),
                        const Spacer(),
                        MyTextField(
                          color: const Color.fromARGB(255, 255, 239, 63),
                          width: setWidth(45),
                          radius: 20,
                          hintText: "Contact",
                          controller: contactController,
                        ),
                      ],
                    ),
                    MyTextField(
                      color: const Color.fromARGB(255, 255, 239, 63),
                      width: setWidth(45),
                      radius: 20,
                      hintText: "CNIC",
                      controller: cnicController,
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
                          onPressed: () async {
                            await createAccountandLogin();
                            final loggedInUser =
                                FirebaseAuth.instance.currentUser;
                            await uploadUserData(
                                cnic: cnicController.text,
                                contactNumber: contactController.text,
                                email: loggedInUser!.email!,
                                gender: genderController.text == "Male"
                                    ? true
                                    : false,
                                name: nameController.text,
                                userID: loggedInUser.uid);
                            await loadcurrentUser();
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Dashboard(),
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
