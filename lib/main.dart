import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:housecontractors/Screens/Main/dashboard.dart';
import 'package:housecontractors/Screens/flashscreen/flashscreen.dart';
import 'package:housecontractors/providers/post_provider.dart';
import 'package:housecontractors/providers/user_provider.dart';
import 'package:housecontractors/themes/mytheme.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
//...
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PostProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MaterialApp(
        title: "HouseContractors",
        theme: MyTheme.Mytheme(),
        home: const FlashScreen(),
      ),
    );
  }
}
