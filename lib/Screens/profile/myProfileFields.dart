
import 'package:flutter/material.dart';

import '../../helper/size_configuration.dart';
import 'bottomModalSheet.dart';

class MyProfileFields extends StatelessWidget {
  MyProfileFields({
    Key? key,
  }) : super(key: key);
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ListTile(
          leading: Text(
            "Name: ",
            style: TextStyle(
                fontSize: getProportionateScreenHeight(20),
                fontWeight: FontWeight.bold),
          ),
          title: Text(
            "Muhammad Azhar",
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
            title: "Change Name",
            hintText: "Name",
          ),
        ),
        const Divider(
          thickness: 0.2,
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
            "email@example.com",
            style: TextStyle(
              fontSize: getProportionateScreenHeight(20),
            ),
          ),
          trailing: Icon(
            Icons.edit,
            size: getProportionateScreenHeight(20),
          ),
        ),
        const Divider(
          thickness: 0.2,
          color: Colors.black,
        ),
        ListTile(
          leading: Text(
            "Name: ",
            style: TextStyle(
                fontSize: getProportionateScreenHeight(20),
                fontWeight: FontWeight.bold),
          ),
          title: Text(
            "Muhammad Azhar",
            style: TextStyle(
              fontSize: getProportionateScreenHeight(20),
            ),
          ),
          trailing: Icon(
            Icons.edit,
            size: getProportionateScreenHeight(20),
          ),
        ),
        const Divider(
          thickness: 0.2,
          color: Colors.black,
        ),
        ListTile(
          leading: Text(
            "Name: ",
            style: TextStyle(
                fontSize: getProportionateScreenHeight(20),
                fontWeight: FontWeight.bold),
          ),
          title: Text(
            "Muhammad Azhar",
            style: TextStyle(
              fontSize: getProportionateScreenHeight(20),
            ),
          ),
          trailing: Icon(
            Icons.edit,
            size: getProportionateScreenHeight(20),
          ),
        ),
        const Divider(
          thickness: 0.2,
          color: Colors.black,
        ),
        ListTile(
          leading: Text(
            "Name: ",
            style: TextStyle(
                fontSize: getProportionateScreenHeight(20),
                fontWeight: FontWeight.bold),
          ),
          title: Text(
            "Muhammad Azhar",
            style: TextStyle(
              fontSize: getProportionateScreenHeight(20),
            ),
          ),
          trailing: Icon(
            Icons.edit,
            size: getProportionateScreenHeight(20),
          ),
        ),
      ],
    );
  }
}
