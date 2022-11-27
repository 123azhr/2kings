import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:housecontractors/Screens/loginSignup/login.dart';
import 'package:housecontractors/providers/post_provider.dart';
import 'package:housecontractors/providers/worker_provider.dart';
import 'package:provider/provider.dart';
import '../../providers/chat_provider.dart';
import '../../providers/current_user_provider.dart';
import '../../providers/service_provider.dart';
import '../../providers/story_provider.dart';
import '../../providers/user_provider.dart';
import '../Main/dashboard.dart';

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
      try {
        final userProvider = Provider.of<UserProvider>(context, listen: false);
        await userProvider.fetch();
      } catch (e) {
        print(e);
      }
      final serviceProvider =
          Provider.of<ServiceProvider>(context, listen: false);
      await serviceProvider.fetch();
     
      final chatProvider = Provider.of<ChatProvider>(context, listen: false);
      await chatProvider.fetch();

      final storyProvider = Provider.of<StoryProvider>(context, listen: false);
      await storyProvider.fetch();

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
      return const Dashboard();
    } else {
      return const Login();
    }
  }
}
