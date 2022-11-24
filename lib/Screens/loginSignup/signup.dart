import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:housecontractors/Screens/Main/dashboard.dart';
import 'package:housecontractors/Screens/loginSignup/login.dart';
import 'package:housecontractors/Screens/loginSignup/user_form.dart';
import 'mytextfield.dart';
import 'package:email_validator/email_validator.dart';

// ignore: must_be_immutable
class Signup extends StatefulWidget {
  Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool emailError = false;

  bool passError = false;

  bool confirmError = false;

  bool validateStructure(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

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
          color: const Color.fromARGB(255, 255, 239, 63),
        ),
        Visibility(
          visible: emailError,
          child: const Text(
            "Invalid Email",
            style: TextStyle(color: Colors.red),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        MyTextField(
          controller: passController,
          width: 300,
          radius: 20,
          hintText: "Password",
          color: const Color.fromARGB(255, 255, 239, 63),
        ),
        Visibility(
          visible: passError,
          child: const Text(
            "Invalid password",
            style: TextStyle(color: Colors.red),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        MyTextField(
          controller: cpassController,
          width: 300,
          radius: 20,
          hintText: "Confirm Password",
          color: const Color.fromARGB(255, 255, 239, 63),
        ),
        Visibility(
          visible: confirmError,
          child: const Text(
            "Type same password as above",
            style: TextStyle(
              color: Colors.red,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        const SizedBox(
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
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.blue),
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
        const SizedBox(
          height: 30,
        ),
        SizedBox(
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
              if (EmailValidator.validate(emailController.text) &&
                  emailController.text.isNotEmpty) {
                confirmError = false;
                if (validateStructure(passController.text) &&
                    passController.text.isNotEmpty) {
                  passError = false;
                  if (passController.text == cpassController.text &&
                      cpassController.text.isNotEmpty) {
                    confirmError = false;
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const UserForm()),
                    );
                  } else {
                    confirmError = true;
                  }
                } else {
                  passError = true;
                }
              } else {
                emailError = true;
              }
            },
            child: const Text("Signup"),
          ),
        )
      ]),
    );
  }
}
