import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:housecontractors/Screens/loginSignup/login.dart';
import 'package:housecontractors/Screens/loginSignup/user_form.dart';
import 'package:housecontractors/helper/size_configuration.dart';
import 'package:housecontractors/providers/authentication_provider.dart';
import 'package:provider/provider.dart';
import 'mytextfield.dart';
import 'package:email_validator/email_validator.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool emailError = false;
  bool passError = false;
  bool confirmError = false;
  bool obsecureText = true;
  List userData = [];
  bool validateStructure(String value) {
    String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passController = TextEditingController();

  final TextEditingController cpassController = TextEditingController();

  createUser() async {
    FirebaseAuth authInstance = FirebaseAuth.instance;
    await authInstance.createUserWithEmailAndPassword(
        email: "azhar@gmail.com", password: "123456789");
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
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: setWidth(10)),
            child: SizedBox(
              height: setHeight(100),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "assets/images/logo-black-full.png",
                      height: setHeight(30),
                    ),
                    Text(
                      "Signup",
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    SizedBox(
                      height: setHeight(5),
                    ),
                    MyTextField(
                      controller: emailController,
                      width: setWidth(80),
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
                    SizedBox(
                      height: setHeight(4),
                    ),
                    MyTextField(
                      controller: passController,
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
                      obsecure: obsecureText,
                    ),
                    Visibility(
                      visible: passError,
                      child: const Text(
                        "length greater than 8 and includes capital & small letter and digit",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                    SizedBox(
                      height: setHeight(4),
                    ),
                    MyTextField(
                      controller: cpassController,
                      width: setWidth(80),
                      radius: 20,
                      hintText: "Confirm Password",
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
                      obsecure: obsecureText,
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
                    SizedBox(
                      height: setHeight(4),
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
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                            // ignore: avoid_print
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Login()),
                                );
                              },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: setHeight(4),
                    ),
                    SizedBox(
                      width: setWidth(35),
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
                        onPressed: () async {
                          if (EmailValidator.validate(emailController.text) &&
                              emailController.text.isNotEmpty) {
                            emailError = false;
                            if (validateStructure(passController.text) &&
                                passController.text.isNotEmpty) {
                              passError = false;
                              if (passController.text == cpassController.text &&
                                  cpassController.text.isNotEmpty) {
                                confirmError = false;
                                userData.addAll([
                                  emailController.text,
                                  passController.text
                                ]);
                                await context
                                    .read<AuthenticationService>()
                                    .signUp(
                                        email: emailController.text.trim(),
                                        password: passController.text.trim());
                                showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: ((context) => const Center(
                                      child: CircularProgressIndicator())),
                                ).then((value) async => await Future.delayed(
                                      const Duration(seconds: 5),
                                      () async {
                                        await showDialog(
                                          context: context,
                                          builder: (context) => SizedBox(
                                            height: setHeight(5),
                                            width: setWidth(20),
                                            child: Card(
                                              child: Center(
                                                  child: Text(
                                                      "Registration Successful")),
                                            ),
                                          ),
                                        );
                                      },
                                    )
                                        //     .then((value) async {
                                        //   showDialog(
                                        //     context: context,
                                        //     builder: (context) => SizedBox(
                                        //       height: setHeight(5),
                                        //       width: setWidth(20),
                                        //       child: Card(
                                        //         child: Center(
                                        //             child: Text(
                                        //                 "Registration Successful")),
                                        //       ),
                                        //     ),
                                        //   );
                                        // })
                                        .then((value) => context
                                            .read<AuthenticationService>()
                                            .signIn(
                                                email:
                                                    emailController.text.trim(),
                                                password: passController.text
                                                    .trim())));

                                // controlle

                                // showDialog(
                                //       context: context,
                                //       builder: (context) => SizedBox(
                                //         height: setHeight(5),
                                //         width: setWidth(20),
                                //         child: const Card(
                                //           child: Center(
                                //               child: Text(
                                //                   "Registration Successful")),
                                //         ),
                                //       ),
                                //     ))
                                // .then((value) => context
                                //     .read<AuthenticationService>()
                                //     .signIn(
                                //         email: emailController.text.trim(),
                                //         password:
                                //             passController.text.trim()));
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          UserForm(userData: userData),
                                    ));
                              } else {
                                confirmError = true;
                              }
                            } else {
                              passError = true;
                            }
                          } else {
                            emailError = true;
                          }
                          setState(() {});
                        },
                        child: const Text("Signup"),
                      ),
                    ),
                    const Spacer()
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
