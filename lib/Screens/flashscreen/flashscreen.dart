// ignore_for_file: empty_catches

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:housecontractors/Screens/loginSignup/loading_screen.dart';
import 'package:housecontractors/Screens/loginSignup/login.dart';
import 'package:housecontractors/providers/about.dart';
import 'package:housecontractors/providers/agreement_provider.dart';
import 'package:housecontractors/providers/comments_provider.dart';
import 'package:housecontractors/providers/customer_provider.dart';
import 'package:housecontractors/providers/inventory_provider.dart';
import 'package:housecontractors/providers/message_provider.dart';
import 'package:housecontractors/providers/post_provider.dart';
import 'package:housecontractors/providers/worker_provider.dart';
import 'package:provider/provider.dart';
import '../../providers/chat_provider.dart';
import '../../providers/service_log_provider.dart';
import '../../providers/order_provider.dart';
import '../../providers/service_provider.dart';
import '../../providers/story_provider.dart';
import '../../providers/contractor_provider.dart';
import '../Dashboard/dashboard.dart';
import '../loginSignup/verify_email.dart';

class FlashScreen extends StatefulWidget {
  const FlashScreen({Key? key}) : super(key: key);

  @override
  State<FlashScreen> createState() => _FlashScreenState();
}

class _FlashScreenState extends State<FlashScreen> {
  @override
  void initState() {
    try {
      loadData();
    } catch (e) {}
    super.initState();
  }

  loadData() async {
    await Future.delayed(const Duration(milliseconds: 0)).then((value) async {
      final postProvider = Provider.of<PostProvider>(context, listen: false);
      await postProvider.fetch();

      Provider.of<CommentsProvider>(context, listen: false);

      try {
        final userProvider =
            Provider.of<ContractorsProvider>(context, listen: false);
        await userProvider.fetch();
      } catch (e) {}
      try {
        final cProvider = Provider.of<CustomerProvider>(context, listen: false);
        await cProvider.fetch();
      } catch (e) {}
      final storyProvider = Provider.of<StoryProvider>(context, listen: false);
      await storyProvider.fetch();
      final serviceProvider =
          Provider.of<ServiceProvider>(context, listen: false);
      await serviceProvider.fetch();
      try {
        AboutProvider aboutProvider =
            Provider.of<AboutProvider>(context, listen: false);
        await aboutProvider.fetchAboutData();
      } catch (e) {}

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => const AuthenticationWrapper()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      child: Center(
        child:
            Image.asset('assets/images/logo-black-full.png', fit: BoxFit.fill),
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();

    if (firebaseUser != null) {
      if (FirebaseAuth.instance.currentUser!.emailVerified) {
        currentUserID = FirebaseAuth.instance.currentUser!.uid;
        return const Loading();
      } else {
        return const VerifyEmail();
      }
    } else {
      return const Login();
    }
  }
}
