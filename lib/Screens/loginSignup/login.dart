import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:housecontractors/Screens/loginSignup/signup.dart';
import 'package:housecontractors/helper/size_configuration.dart';
import 'package:provider/provider.dart';
import '../../providers/user_provider.dart';
import '../Main/dashboard.dart';
import 'mytextfield.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final usersList = userProvider.getList;
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
          color: const Color.fromARGB(255, 255, 239, 63),
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
              for (int i = 0; i < usersList.length; i++) {
                if (emailController.text != usersList[i].email &&
                    passController.text != usersList[i].password) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const Dashboard()),
                  );
                } else {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (context) => Container(
                        height: 100,
                        width: 400,
                        color: Color.fromARGB(0, 244, 67, 54),
                        child: Card(
                            color: Color.fromARGB(255, 255, 82, 59),
                            child: Center(
                                child:
                                    Text("Email or Password is incorrect")))),
                  );
                }
              }
            },
            child: const Text(
              "login",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
        const SizedBox(
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
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.blue),
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
