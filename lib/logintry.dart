
import 'package:flutter/material.dart';
import 'package:housecontractors/providers/authentication_provider.dart';
import 'package:provider/provider.dart';

import 'Screens/loginSignup/mytextfield.dart';
import 'helper/size_configuration.dart';

class logintry extends StatelessWidget {
  logintry({super.key});

  final emailController = TextEditingController();
  final passController = TextEditingController();

  

  // Future signIn() async{

  //    await FirebaseAuth.instance.signInWithEmailAndPassword(
  //       email: emailController.text.trim(),
  //       password: passController.text.trim());
  // }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Material(
      child: SingleChildScrollView(
        child: Column(children: [
          Image.asset(
            "assets/images/logo-black-full.png",
            height: setHeight(40),
          ),
          Text(
            "Login",
            style: Theme.of(context).textTheme.displayLarge,
          ),
          SizedBox(
            height: (MediaQuery.of(context).size.height) / 30,
          ),
          MyTextField(
            height: 50,
            controller: emailController,
            width: 300,
            radius: 20,
            hintText: "Email",
            color: const Color.fromARGB(255, 255, 239, 63),
          ),
          SizedBox(
            height: 30,
          ),
          MyTextField(
            height: 50,
            controller: passController,
            obsecure: true,
            width: 300,
            radius: 20,
            hintText: "Password",
            color: const Color.fromARGB(255, 255, 239, 63),
          ),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            width: 150,
            height: 50,
            child: ElevatedButton.icon(
                label: Text(
                  "login",
                  style: TextStyle(fontSize: 20),
                ),
                icon: Icon(Icons.lock_open),
                style: ElevatedButton.styleFrom(
                  //background color of button
                  side: const BorderSide(
                    width: 0,
                  ), //border width and color
                  elevation: 3, //elevation of button
                  shape: RoundedRectangleBorder(
                      //to set border radius to button
                      borderRadius: BorderRadius.circular(30)),

                  //content padding inside button
                ),
                onPressed: () {
                  context.read<AuthenticationService>().signIn(
                      email: emailController.text.trim(),
                      password: passController.text.trim());
                }),
          ),
        ]),
      ),
    );
  }
}
