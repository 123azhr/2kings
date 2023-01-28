// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:housecontractors/Screens/flashscreen/flashscreen.dart';
import 'package:housecontractors/Screens/loginSignup/login.dart';
import 'package:housecontractors/helper/size_configuration.dart';
import 'package:housecontractors/widgets/mycontainer.dart';
import 'package:provider/provider.dart';
import 'package:restart_app/restart_app.dart';

import '../../providers/authentication_provider.dart';
import '../../providers/contractor_provider.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({super.key});

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

Future<bool> _isVerified(BuildContext context) async {
  if (FirebaseAuth.instance.currentUser!.emailVerified) {
    final currentUserProvider =
        Provider.of<ContractorsProvider>(context, listen: false);

    await currentUserProvider.fetch();
    return true;
  } else {
    return false;
  }
}

class _VerifyEmailState extends State<VerifyEmail> {
  @override
  void initState() {
    FirebaseAuth.instance.currentUser!.sendEmailVerification();
    print("email verification sent");
    //
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leadingWidth: getProportionateScreenWidth(40),
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Verify Email",
          style: TextStyle(
            color: Colors.black,
            fontSize: (kToolbarHeight / 100) * 40,
          ),
        ),
        centerTitle: true,
        elevation: 1,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: setHeight(5),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(200, 50),
                    side: const BorderSide(
                      width: 0,
                    ),
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                  onPressed: () {
                    setState(() async {
                      FirebaseAuth.instance.currentUser!.reload();
                      if (await _isVerified(context)) {
                        Restart.restartApp();

                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const FlashScreen(),
                            ));
                      } else {
                        showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (context) => MyContainer(
                              height: setHeight(15),
                              width: setWidth(90),
                              child: Center(
                                  child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                      "Email not verified kindly check your mail and verify email"),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        fixedSize: const Size(200, 50),
                                        side: const BorderSide(
                                          width: 0,
                                        ),
                                        elevation: 3,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                      ),
                                      onPressed: () {
                                        FirebaseAuth.instance.currentUser!
                                            .sendEmailVerification();
                                        Navigator.pop(context);
                                      },
                                      child: const Text("Resend Email"))
                                ],
                              ))),
                        );
                      }
                    });
                  },
                  child: const Text("Verified")),
              SizedBox(
                height: setHeight(5),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(200, 50),
                    side: const BorderSide(
                      width: 0,
                    ),
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                  onPressed: () {
                    context.read<AuthenticationService>().signOut();
                    final currentUserProvider =
                        Provider.of<ContractorsProvider>(context,
                            listen: false);

                    currentUserProvider.clearList();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Login(),
                        ));
                  },
                  child: const Text("sign out"))
            ]),
      ),
    ));
  }
}
