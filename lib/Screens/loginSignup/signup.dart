import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:housecontractors/Screens/Main/dashboard.dart';
import 'package:housecontractors/Screens/loginSignup/login.dart';
import 'mytextfield.dart';

class Signup extends StatelessWidget {
  Signup({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passController = TextEditingController();

  final TextEditingController cpassController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(children: [
        Image.asset(
          "assets/images/logo-black-full.png",
          height: (MediaQuery.of(context).size.height) / 3,
        ),
        Text(
          "Signup",
          style: Theme.of(context).textTheme.displayLarge,
        ),
        SizedBox(
          height: (MediaQuery.of(context).size.height) / 30,
        ),
        MyTextField(
          controller: emailController,
          width: 300,
          radius: 20,
          hintText: "Email",
          color: Color.fromARGB(255, 255, 239, 63),
        ),
        const SizedBox(
          height: 30,
        ),
        MyTextField(
          controller: passController,
          width: 300,
          radius: 20,
          hintText: "Password",
          color: Color.fromARGB(255, 255, 239, 63),
        ),
        SizedBox(
          height: 30,
        ),
        MyTextField(
          controller: cpassController,
          width: 300,
          radius: 20,
          hintText: "Confirm Password",
          color: Color.fromARGB(255, 255, 239, 63),
        ),
        SizedBox(
          height: 30,
        ),
        RichText(
          text: TextSpan(
            children: [
              const TextSpan(
                text: 'Already have an account? ',
                style: TextStyle(fontSize: 10, color: Colors.grey),
              ),
              TextSpan(
                text: 'login here',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
                // ignore: avoid_print
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  },
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
        SizedBox(
          width: 150,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              //background color of button
              side: BorderSide(
                width: 1,
              ), //border width and color
              elevation: 3, //elevation of button
              shape: RoundedRectangleBorder(
                  //to set border radius to button
                  borderRadius: BorderRadius.circular(30)),
              padding: EdgeInsets.all(20),

              //content padding inside button
            ),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Dashboard()),
              );
            },
            child: Text("Signup"),
          ),
        )
      ]),
    );
  }
}
