import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:housecontractors/Screens/loginSignup/signup.dart';
import 'package:housecontractors/helper/size_configuration.dart';
import 'package:provider/provider.dart';
import '../../providers/authentication_provider.dart';
import '../../providers/user_provider.dart';
import 'mytextfield.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passController = TextEditingController();

  void dispose() {
    emailController.dispose();
    passController.dispose();
  }

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passController.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    final userProvider = Provider.of<UserProvider>(context);
    final usersList = userProvider.getList;
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
            height: getProportionateScreenHeight(50),
            controller: emailController,
            width: 300,
            radius: 20,
            hintText: "Email",
            color: const Color.fromARGB(255, 255, 239, 63),
          ),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          MyTextField(
            height: getProportionateScreenHeight(50),
            controller: passController,
            obsecure: true,
            width: 300,
            radius: 20,
            hintText: "Password",
            color: const Color.fromARGB(255, 255, 239, 63),
          ),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          SizedBox(
            width: 150,
            height: getProportionateScreenHeight(50),
            child: ElevatedButton.icon(
                label: Text(
                  "login",
                  style: TextStyle(fontSize: getProportionateScreenHeight(20)),
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
                }
                // for (int i = 0; i < usersList.length; i++) {
                //   if (emailController.text != usersList[i].email &&
                //       passController.text != usersList[i].password) {
                //     Navigator.pushReplacement(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) => const Dashboard()),
                //     );
                //   } else {
                //     showCupertinoModalPopup(
                //       context: context,
                //       builder: (context) => Container(
                //           height: getProportionateScreenHeight(100),
                //           width: 400,
                //           color: Color.fromARGB(0, 244, 67, 54),
                //           child: Card(
                //               color: Color.fromARGB(255, 255, 82, 59),
                //               child: Center(
                //                   child:
                //                       Text("Email or Password is incorrect")))),
                //     );
                //   }
                // }
                ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(20),
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
      ),
    );
  }
}
