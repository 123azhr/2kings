import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:housecontractors/Screens/Dashboard/dashboard.dart';
import 'package:housecontractors/Screens/loginSignup/login.dart';
import 'package:housecontractors/helper/size_configuration.dart';
import 'package:housecontractors/widgets/mycontainer.dart';
import 'package:provider/provider.dart';

import '../../providers/authentication_provider.dart';
import '../../providers/current_user_provider.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({super.key});

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

bool _isVerified(BuildContext context) {
  if (FirebaseAuth.instance.currentUser!.emailVerified) {
    final currentUserProvider =
        Provider.of<CurrentUserProvider>(context, listen: false);

    currentUserProvider.fetch();
    return true;
  } else {
    return false;
  }
}

class _VerifyEmailState extends State<VerifyEmail> {
  @override
  void initState() {
    // FirebaseAuth.instance.currentUser!.sendEmailVerification();
    print("email verification sent");
    // TODO: implement initState
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
      body: SingleChildScrollView(
          child: Column(children: [
        ElevatedButton(
            onPressed: () {
              setState(() {
                FirebaseAuth.instance.currentUser!.reload();
                if (_isVerified(context)) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Dashboard(),
                      ));
                } else {
                  //FirebaseAuth.instance.currentUser!.sendEmailVerification();
                  showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (context) => MyContainer(
                        height: setHeight(10),
                        width: setWidth(90),
                        child: Center(
                            child: Column(
                          children: [
                            Text(
                                "Email not verified kindly check your mail and verify email"),
                            ElevatedButton(
                                onPressed: () {
                                  print("Email sent Successfully");
                                },
                                child: const Text("Resent Email"))
                          ],
                        ))),
                  );
                }
              });
            },
            child: const Text("Verified")),
        ElevatedButton(
            onPressed: () {
              context.read<AuthenticationService>().signOut();
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Login(),
                  ));
            },
            child: const Text("sign out"))
      ])),
    ));
  }
}
