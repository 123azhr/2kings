import 'package:flutter/material.dart';
import 'package:housecontractors/Screens/loginSignup/mytextfield.dart';
import 'package:housecontractors/widgets/mycontainer.dart';

import '../../helper/size_configuration.dart';

class CreatePost extends StatelessWidget {
  const CreatePost({super.key});

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
        ),
        body: Column(children: [
          Row(
            children: [
              SizedBox(
                height: getProportionateScreenHeight(60),
                width: getProportionateScreenWidth(80),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://images.pexels.com/photos/1172253/pexels-photo-1172253.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                ),
              ),
              Column(
                children: [
                  Text("Muhammad Azhar"),
                ],
              ),
              Spacer(),
              Icon(
                Icons.image,
                size: 40,
                color: Colors.black87,
              ),
            ],
          ),
          TextFormField(
            maxLines: 30,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 18,
            ),
            decoration: InputDecoration(
              filled: true,
              contentPadding: EdgeInsets.all(10),
              isCollapsed: true,
              hintText: "What's in your mind?",
            ),
          ),
        ]),
      ),
    );
  }
}
