import 'package:flutter/material.dart';
import '../../helper/size_configuration.dart';
import '../../widgets/bottom_modal_sheet.dart';

class MyProfileFields extends StatefulWidget {
  MyProfileFields(
      {Key? key,
      required this.contactController,
      required this.emailController,
      required this.genderController,
      required this.nameController,
      required this.passwordController})
      : super(key: key);
  TextEditingController nameController;

  TextEditingController genderController;

  TextEditingController passwordController;

  TextEditingController contactController;

  TextEditingController emailController;
  @override
  State<MyProfileFields> createState() => _MyProfileFieldsState();
}

class _MyProfileFieldsState extends State<MyProfileFields> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          height: getProportionateScreenHeight(5),
        ),
        ListTile(
          leading: Text(
            "Name:     ",
            style: TextStyle(
                fontSize: getProportionateScreenHeight(20),
                fontWeight: FontWeight.bold),
          ),
          title: Text(
            widget.nameController.text,
            style: TextStyle(
              fontSize: getProportionateScreenHeight(20),
            ),
          ),
          trailing: Icon(
            Icons.edit,
            size: getProportionateScreenHeight(20),
          ),
          onTap: () => customBottomModalSheet(
            button: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_forward_rounded)),
            context: context,
            hight: getProportionateScreenHeight(400),
            controller: widget.nameController,
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
            "Gender:  ",
            style: TextStyle(
                fontSize: getProportionateScreenHeight(20),
                fontWeight: FontWeight.bold),
          ),
          title: Text(
            widget.genderController.text == "true" ? "Male" : "Female",
            style: TextStyle(
              fontSize: getProportionateScreenHeight(20),
            ),
          ),
          trailing: Icon(
            Icons.edit,
            size: getProportionateScreenHeight(20),
          ),
          onTap: () => customBottomModalSheet(
            button: IconButton(
                onPressed: () {
                  
                  setState(() {});
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_forward_rounded)),
            context: context,
            hight: 356,
            controller: widget.genderController,
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
            widget.contactController.text,
            style: TextStyle(
              fontSize: getProportionateScreenHeight(20),
            ),
          ),
          trailing: Icon(
            Icons.edit,
            size: getProportionateScreenHeight(20),
          ),
          onTap: () => customBottomModalSheet(
            button: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_forward_rounded)),
            context: context,
            hight: getProportionateScreenHeight(356),
            controller: widget.contactController,
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
            widget.emailController.text,
            style: TextStyle(
              fontSize: getProportionateScreenHeight(20),
            ),
          ),
          trailing: Icon(
            Icons.edit,
            size: getProportionateScreenHeight(20),
          ),
          onTap: () => customBottomModalSheet(
            button: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_forward_rounded)),
            context: context,
            hight: 356,
            controller: widget.emailController,
            title: "Change Email",
            hintText: "example@xyz.com",
          ),
        ),
        Divider(
          thickness: getProportionateScreenHeight(0.2),
          color: Colors.black,
        ),
        ListTile(
          leading: Text(
            "Password:",
            style: TextStyle(
                fontSize: getProportionateScreenHeight(20),
                fontWeight: FontWeight.bold),
          ),
          title: Text(
            widget.passwordController.text,
            style: TextStyle(
              fontSize: getProportionateScreenHeight(20),
            ),
          ),
          trailing: Icon(
            Icons.edit,
            size: getProportionateScreenHeight(20),
          ),
          onTap: () => customBottomModalSheet(
            button: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_forward_rounded)),
            context: context,
            hight: getProportionateScreenHeight(356),
            controller: widget.passwordController,
            title: "Change Password",
            hintText: "New Password",
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(5),
        )
      ],
    );
  }
}
