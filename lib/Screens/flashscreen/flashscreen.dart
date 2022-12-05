import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:housecontractors/Screens/loginSignup/login.dart';
import 'package:housecontractors/providers/aggrement_provider.dart';
import 'package:housecontractors/providers/message_provider.dart';
import 'package:housecontractors/providers/post_provider.dart';
import 'package:housecontractors/providers/worker_provider.dart';
import 'package:provider/provider.dart';
import '../../providers/chat_provider.dart';
import '../../providers/current_user_provider.dart';
import '../../providers/logs_provider.dart';
import '../../providers/order_provider.dart';
import '../../providers/service_provider.dart';
import '../../providers/story_provider.dart';
import '../../providers/user_provider.dart';
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
    } catch (e) {
      print("cannot load data");
    }
    super.initState();
  }

  loadData() async {
    await Future.delayed(const Duration(milliseconds: 0)).then((value) async {
      try {
        final currentUserProvider =
            Provider.of<CurrentUserProvider>(context, listen: false);
        currentUserProvider.fetch();
      } catch (e) {
        print(e);
      }
      try {
        final workersProvider =
            Provider.of<WorkerProvider>(context, listen: false);
        workersProvider.fetch();
      } catch (e) {
        print(e);
      }
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
      final ordersProvider =
          Provider.of<OrdersProvider>(context, listen: false);
      await ordersProvider.fetch();
      try {
        final chatProvider = Provider.of<ChatProvider>(context, listen: false);
        await chatProvider.fetch();
      } catch (e) {
        print(e);
      }
      final storyProvider = Provider.of<StoryProvider>(context, listen: false);
      await storyProvider.fetch();

      try {
        final messageProvider =
            Provider.of<MessageProvider>(context, listen: false);

        messageProvider.fetch();
      } catch (e) {
        print(e);
      }
      try {
        final aggrementProvider =
            Provider.of<AggrementProvider>(context, listen: false);

        aggrementProvider.fetch();
      } catch (e) {
        print(e);
      }
      try {
        Provider.of<LogsProvider>(context, listen: false);
      } catch (e) {
        print(e);
      }
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
        return const Dashboard();
      } else {
        return const VerifyEmail();
      }
    } else {
      return const Login();
    }
  }
}
