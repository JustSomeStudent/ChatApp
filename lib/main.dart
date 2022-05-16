import 'package:flutter/material.dart';
import 'package:mix_chat_app/screens/account_screen.dart';
import 'package:mix_chat_app/screens/forgot_password_screen.dart';

import 'package:mix_chat_app/screens/login_screen.dart';

import 'package:firebase_core/firebase_core.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  );
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignIn(),
    );

  }

}
