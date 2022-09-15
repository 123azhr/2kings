import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:housecontractors/Screens/profile/profileView.dart';
import 'package:housecontractors/themes/mytheme.dart';
import 'Screens/Main/mainpage.dart';
import 'firebase_options.dart';
import 'helper/size_configuration.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "HouseContractors",
      theme: MyTheme.Mytheme(),
      home: ProfileView(),
    );
  }
}
