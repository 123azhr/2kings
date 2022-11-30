import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:housecontractors/Screens/Dashboard/dashboard.dart';
import 'package:housecontractors/Screens/loginSignup/loading_screen.dart';
import 'package:housecontractors/Screens/loginSignup/signup.dart';
import 'package:housecontractors/Screens/loginSignup/verify_email.dart';
import 'package:housecontractors/helper/size_configuration.dart';
import 'package:housecontractors/models/current_user.dart';
import 'package:housecontractors/models/workers_model.dart';
import 'package:provider/provider.dart';
import '../../providers/authentication_provider.dart';
import '../../providers/current_user_provider.dart';
import '../../widgets/mycontainer.dart';
import 'mytextfield.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();

  bool obsecureText = true;
  final passController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Material(
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
              width: setWidth(80),
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
              obsecure: obsecureText,
              width: setWidth(80),
              radius: 20,
              hintText: "Password",
              color: const Color.fromARGB(255, 255, 239, 63),
              leading: IconButton(
                onPressed: () {
                  setState(() {
                    obsecureText = !obsecureText;
                  });
                },
                icon: obsecureText
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.visibility),
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            SizedBox(
              width: setWidth(40),
              height: getProportionateScreenHeight(50),
              child: ElevatedButton.icon(
                  label: Text(
                    "login",
                    style:
                        TextStyle(fontSize: getProportionateScreenHeight(20)),
                  ),
                  icon: const Icon(Icons.lock_open),
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
                  onPressed: () async {
                    showDialog(
                        context: context,
                        builder: (context) =>
                            const Center(child: CircularProgressIndicator()));
                    String isSignedin = await context
                        .read<AuthenticationService>()
                        .signIn(
                            email: emailController.text.trim(),
                            password: passController.text.trim());
                    if (isSignedin == "signed in") {
                      if (FirebaseAuth.instance.currentUser!.emailVerified) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Dashboard(),
                            ));
                      } else {
                        Navigator.pop(context);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const VerifyEmail(),
                            ));
                      }
                    } else {
                      showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (context) => MyContainer(
                            height: setHeight(10),
                            width: setWidth(90),
                            child: const Center(
                                child: Center(
                                    child: Text(
                                        "Email / Password is incorrect")))),
                      );
                    }
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
                          MaterialPageRoute(
                              builder: (context) => const Signup()),
                        );
                      },
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
