// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:housecontractors/Screens/loginSignup/loading_screen.dart';
import 'package:housecontractors/Screens/loginSignup/signup.dart';
import 'package:housecontractors/Screens/loginSignup/verify_email.dart';
import 'package:housecontractors/helper/size_configuration.dart';
import 'package:provider/provider.dart';
import '../../providers/authentication_provider.dart';
import '../../providers/contractor_provider.dart';
import '../../widgets/mycontainer.dart';
import 'mytextfield.dart';
import 'package:restart_app/restart_app.dart';

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
    final userProvider = Provider.of<ContractorsProvider>(context);

    userProvider.fetch();
    SizeConfig().init(context);
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: WillPopScope(
        onWillPop: () async => false,
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
                      side: const BorderSide(
                        width: 0,
                      ),
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                    onPressed: () async {
                      bool isAvailable = false;

                      for (var item in userProvider.getList) {
                        if (item.email == emailController.text.trim()) {
                          isAvailable = true;
                        }
                      }
                      if (isAvailable == true) {
                        // showDialog(
                        //     barrierDismissible: true,
                        //     context: context,
                        //     builder: (context) =>
                        //         const Center(child: CircularProgressIndicator()));
                        String isSignedin = await context
                            .read<AuthenticationService>()
                            .signIn(
                                email: emailController.text.trim(),
                                password: passController.text.trim());
                        if (isSignedin == "signed in") {
                          await FirebaseAuth.instance.currentUser!.reload();

                          print(FirebaseAuth.instance.currentUser!.uid +
                              " login page");
                          currentUserID =
                              FirebaseAuth.instance.currentUser!.uid;
                          print(currentUserID + "logged in");
                          if (FirebaseAuth
                              .instance.currentUser!.emailVerified) {
                                Restart.restartApp();
                          
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      Loading(userID: currentUserID),
                                ));
                          } else {
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
                                color: Colors.yellow,
                                height: setHeight(10),
                                width: setWidth(90),
                                child: const Center(
                                    child: Text(
                                  "Email / Password is incorrect",
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 18),
                                ))),
                          );
                        }
                      } else {
                        showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (context) => MyContainer(
                              color: Colors.yellow,
                              height: setHeight(20),
                              width: setWidth(50),
                              child: const Center(
                                  child:
                                      Text("No User found with this email"))),
                        );
                      }
                    }),
              ),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: 'Forgot Password? ',
                      style: TextStyle(fontSize: 10, color: Colors.grey),
                    ),
                    TextSpan(
                      text: 'click here to reset',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          try {
                            FirebaseAuth.instance.sendPasswordResetEmail(
                                email: emailController.text);
                            showModalBottomSheet(
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (context) => MyContainer(
                                  color: Colors.yellow,
                                  height: setHeight(10),
                                  width: setWidth(90),
                                  child: const Center(
                                      child: Text(
                                    "Password reset link sent to your Email",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 18),
                                  ))),
                            );
                          } catch (e) {
                            showModalBottomSheet(
                                backgroundColor: Colors.transparent,
                                context: context,
                                builder: (context) => MyContainer(
                                    color: Colors.yellow,
                                    height: setHeight(20),
                                    width: setWidth(50),
                                    child: Center(child: Text(e.toString()))));
                          }
                        },
                    ),
                  ],
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
      ),
    );
  }
}
