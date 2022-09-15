import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:housecontractors/Screens/loginSignup/signup.dart';
import '../Main/mainpage.dart';
import 'mytextfield.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(children: [
        Image.asset(
          "assets/images/logo-black-full.png",
          height: (MediaQuery.of(context).size.height) / 3,
        ),
        Text(
          "Login",
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
                MaterialPageRoute(builder: (context) => MainPage()),
              );
            },
            child: Text("login"),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        RichText(
          text: TextSpan(
            children: [
              const TextSpan(
                text: 'Don\'t have an account? ',
                style: TextStyle(fontSize: 10, color: Colors.grey),
              ),
              TextSpan(
                text: 'signup here',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
                // ignore: avoid_print
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Signup()),
                    );
                  },
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
