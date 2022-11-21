import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:housecontractors/helper/size_configuration.dart';
import 'package:housecontractors/providers/user_provider.dart';
import 'package:housecontractors/providers/worker_provider.dart';
import 'package:housecontractors/widgets/mycontainer.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../widgets/bottom_modal_sheet.dart';

class AddWorker extends StatefulWidget {
  const AddWorker({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  State<AddWorker> createState() => _AddWorkerState();
}

class _AddWorkerState extends State<AddWorker> {
  String _imagePath = "";
  File? _selectedImageFile;
  bool? _isProductImageSelected = true;

  TextEditingController nameController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController experienceController = TextEditingController();
  TextEditingController serviceController = TextEditingController();
  TextEditingController cnicController = TextEditingController();

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
        userProvider.getCurrentUser();
    final workerProvider = Provider.of<WorkerProvider>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
          backgroundColor: Colors.yellow,
          centerTitle: true,
          title: Text(
            "Add " + widget.title,
            style: TextStyle(
              color: Colors.black,
              fontSize: (kToolbarHeight / 100) * 40,
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _selectedImageFile != null
                ? Stack(
                    children: [
                      MyContainer(
                        width: setWidth(90),
                        height: setHeight(30),
                        child: Image.file(_selectedImageFile!),
                      ),
                      FloatingActionButton(
                          onPressed: () {
                            _selectedImageFile = null;
                            setState(() {});
                          },
                          child: Icon(Icons.cancel),
                          mini: true),
                    ],
                  )
                : MyContainer(
                    height: setHeight(30),
                    child: InkWell(
                        child: const Icon(Icons.add_a_photo),
                        onTap: () {
                          pickImage();
                          print(_imagePath);
                        }),
                    width: setWidth(90),
                  ),
            ListTile(
              leading: Text(
                "Name:     ",
                style: TextStyle(
                    fontSize: getProportionateScreenHeight(20),
                    fontWeight: FontWeight.bold),
              ),
              title: Text(
                nameController.text,
                style: TextStyle(
                  fontSize: getProportionateScreenHeight(20),
                ),
              ),
              trailing: Icon(
                Icons.edit,
                size: getProportionateScreenHeight(20),
              ),
              onTap: () => customBottomModalSheet(
                context: context,
                hight: getProportionateScreenHeight(400),
                controller: nameController,
                title: "Change Name",
                hintText: "Name",
              ),
            ),
            Divider(
              thickness: getProportionateScreenHeight(0.2),
              color: Colors.black,
            ),
            ListTile(
              leading: Text(
                "Experience:",
                style: TextStyle(
                    fontSize: getProportionateScreenHeight(20),
                    fontWeight: FontWeight.bold),
              ),
              title: Text(
                "     details",
                style: TextStyle(
                  fontSize: getProportionateScreenHeight(20),
                ),
              ),
              trailing: Icon(
                Icons.edit,
                size: getProportionateScreenHeight(20),
              ),
              onTap: () => customBottomModalSheet(
                context: context,
                hight: getProportionateScreenHeight(356),
                controller: nameController,
                title: "Change Password",
                hintText: "New Password",
              ),
            ),
            Divider(
              thickness: getProportionateScreenHeight(0.2),
              color: Colors.black,
            ),
            ListTile(
              leading: Text(
                "Gender:  ",
                style: TextStyle(
                    fontSize: getProportionateScreenHeight(20),
                    fontWeight: FontWeight.bold),
              ),
              title: Text(
                "gender",
                style: TextStyle(
                  fontSize: getProportionateScreenHeight(20),
                ),
              ),
              trailing: Icon(
                Icons.edit,
                size: getProportionateScreenHeight(20),
              ),
              onTap: () => customBottomModalSheet(
                context: context,
                hight: 356,
                controller: nameController,
                title: "Change Gender",
                hintText: "male/female",
              ),
            ),
            Divider(
              thickness: getProportionateScreenHeight(0.2),
              color: Colors.black,
            ),
            ListTile(
              leading: Text(
                "Contact:",
                style: TextStyle(
                    fontSize: getProportionateScreenHeight(20),
                    fontWeight: FontWeight.bold),
              ),
              title: Text(
                "contact",
                style: TextStyle(
                  fontSize: getProportionateScreenHeight(20),
                ),
              ),
              trailing: Icon(
                Icons.edit,
                size: getProportionateScreenHeight(20),
              ),
              onTap: () => customBottomModalSheet(
                context: context,
                hight: getProportionateScreenHeight(356),
                controller: nameController,
                title: "Change Contact",
                hintText: "Contact ",
              ),
            ),
            Divider(
              thickness: getProportionateScreenHeight(0.2),
              color: Colors.black,
            ),
            ListTile(
              leading: Text(
                "Email:   ",
                style: TextStyle(
                    fontSize: getProportionateScreenHeight(20),
                    fontWeight: FontWeight.bold),
              ),
              title: Text(
                "email",
                style: TextStyle(
                  fontSize: getProportionateScreenHeight(20),
                ),
              ),
              trailing: Icon(
                Icons.edit,
                size: getProportionateScreenHeight(20),
              ),
              onTap: () => customBottomModalSheet(
                context: context,
                hight: 356,
                controller: nameController,
                title: "Change Email",
                hintText: "example@gmail.com",
              ),
            ),
            Divider(
              thickness: getProportionateScreenHeight(0.2),
              color: Colors.black,
            ),
            ListTile(
              leading: Text(
                "CNIC:   ",
                style: TextStyle(
                    fontSize: getProportionateScreenHeight(20),
                    fontWeight: FontWeight.bold),
              ),
              title: Text(
                "email",
                style: TextStyle(
                  fontSize: getProportionateScreenHeight(20),
                ),
              ),
              trailing: Icon(
                Icons.edit,
                size: getProportionateScreenHeight(20),
              ),
              onTap: () => customBottomModalSheet(
                context: context,
                hight: 356,
                controller: nameController,
                title: "Change Email",
                hintText: "example@gmail.com",
              ),
            ),
            Divider(
              thickness: getProportionateScreenHeight(0.2),
              color: Colors.black,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 18, 18, 18),
                    ),
                    fixedSize: MaterialStateProperty.all(
                      Size(setWidth(30), setHeight(6)),
                    ),
                  ),
                  onPressed: () {},
                  child: Text("Discard",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 255, 210, 32),
                      )),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 255, 210, 32),
                    ),
                    fixedSize: MaterialStateProperty.all(
                      Size(setWidth(30), setHeight(6)),
                    ),
                  ),
                  onPressed: () {
                    var imageURL = workerProvider.uploadWorkerImageToStorage(
                        imagePath: _imagePath, userID: loggedInUser.userID);
                    print(imageURL);

                    workerProvider.uploadWorkerImageToStorage(
                        userID: loggedInUser.userID,
                        imagePath: imageURL.toString());
                    Navigator.pop(context);
                    Future.delayed(const Duration(milliseconds: 0))
                        .then((value) async {
                      await workerProvider.fetch();
                    });
                  },
                  child: Text("Save",
                      style: TextStyle(fontSize: 18, color: Colors.black87)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/*
class AddWorker extends StatelessWidget {
  const AddWorker({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            "Add worker",
            style: TextStyle(
              color: Colors.black,
              fontSize: (kToolbarHeight / 100) * 40,
            ),
          ),
        ),


        // body: Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: ListView.builder(
        //     itemCount: 4,
        //     itemExtent: 60,
        //     itemBuilder: (context, index) => Row(
        //       children: [
        //         Text("Name: "),
        //         MyTextField(
        //           width: setWidth(50),
        //           radius: 20,
        //           height: setHeight(5),
        //         ),
                
        //       ],
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
*/