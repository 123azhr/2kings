import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:housecontractors/Screens/flashscreen/flashscreen.dart';
import 'package:housecontractors/providers/aggrement_provider.dart';
import 'package:housecontractors/providers/chat_provider.dart';
import 'package:housecontractors/providers/current_user_provider.dart';
import 'package:housecontractors/providers/inventory_provider.dart';
import 'package:housecontractors/providers/service_log_provider.dart';
import 'package:housecontractors/providers/message_provider.dart';
import 'package:housecontractors/providers/order_provider.dart';
import 'package:housecontractors/providers/post_provider.dart';
import 'package:housecontractors/providers/service_provider.dart';
import 'package:housecontractors/providers/story_provider.dart';
import 'package:housecontractors/providers/contractor_provider.dart';
import 'package:housecontractors/providers/worker_provider.dart';
import 'package:housecontractors/themes/mytheme.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'providers/authentication_provider.dart';

// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   // If you're going to use other Firebase services in the background, such as Firestore,
//   // make sure you call `initializeApp` before using other Firebase services.
//   await Firebase.initializeApp();

//   print("Handling a background message: ${message.messageId}");
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // FirebaseMessaging messaging = FirebaseMessaging.instance;
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // NotificationSettings settings = await messaging.requestPermission(
  //   alert: true,
  //   announcement: false,
  //   badge: true,
  //   carPlay: false,
  //   criticalAlert: false,
  //   provisional: false,
  //   sound: true,
  // );

  // print('User granted permission: ${settings.authorizationStatus}');
  // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //   print('Got a message whilst in the foreground!');
  //   print('Message data: ${message.data}');

  //   if (message.notification != null) {
  //     print('Message also contained a notification: ${message.notification}'
  // );
  //   }
  // });

  runApp(const MyApp());
//...
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) =>
              context.read<AuthenticationService>().authStateChanges,
          initialData: null,
        ),
        ChangeNotifierProvider(create: (_) => PostProvider()),
        ChangeNotifierProvider(create: (_) => ContractorsProvider()),
        ChangeNotifierProvider(create: (_) => ServiceProvider()),
        ChangeNotifierProvider(create: (_) => WorkerProvider()),
        ChangeNotifierProvider(create: (_) => ChatProvider()),
        ChangeNotifierProvider(create: (_) => StoryProvider()),
        ChangeNotifierProvider(create: (_) => CurrentUserProvider()),
        ChangeNotifierProvider(create: (_) => OrdersProvider()),
        ChangeNotifierProvider(create: (_) => MessageProvider()),
        ChangeNotifierProvider(create: (_) => AggrementProvider()),
        ChangeNotifierProvider(create: (_) => ServiceLogsProvider()),
        ChangeNotifierProvider(create: (_) => InventoryProvider()),
      ],
      child: MaterialApp(
        title: "HouseContractors",
        theme: MyTheme.Mytheme(),
        home: const FlashScreen(),
      ),
    );
  }
}
