import 'package:flutter/material.dart';
import '../../helper/size_configuration.dart';
import '../../widgets/bottom_modal_sheet.dart';

class MyProfileFields extends StatelessWidget {
  MyProfileFields({
    Key? key,
    required this.contact,
    required this.email,
    required this.gender,
    required this.name,
    required this.password,
  }) : super(key: key);
  String name, gender, password, contact, email;

  TextEditingController nameController = TextEditingController();
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
            "Name: ",
            style: TextStyle(
                fontSize: getProportionateScreenHeight(20),
                fontWeight: FontWeight.bold),
          ),
          title: Text(
            name,
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
            "Gender: ",
            style: TextStyle(
                fontSize: getProportionateScreenHeight(20),
                fontWeight: FontWeight.bold),
          ),
          title: Text(
            gender,
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
            "Contact : ",
            style: TextStyle(
                fontSize: getProportionateScreenHeight(20),
                fontWeight: FontWeight.bold),
          ),
          title: Text(
            contact,
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
            "Email: ",
            style: TextStyle(
                fontSize: getProportionateScreenHeight(20),
                fontWeight: FontWeight.bold),
          ),
          title: Text(
            email,
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
            "Password: ",
            style: TextStyle(
                fontSize: getProportionateScreenHeight(20),
                fontWeight: FontWeight.bold),
          ),
          title: Text(
            password,
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
        SizedBox(
          height: getProportionateScreenHeight(5),
        )
      ],
    );
  }
}
